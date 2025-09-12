import 'package:flutter/material.dart';

import 'package:bogo_latest/core/utils/constants/app_assets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' hide LatLng;
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_sizes.dart';
import '../../../core/utils/constants/app_styles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  // Example coordinates (replace with your real coords)
  final LatLng _hotelLatLng = LatLng(24.8607, 67.0011);
  final LatLng _youLatLng = LatLng(24.8580, 67.0030);

  final String _mapStyle = '''[
  {
    "stylers": [
      { "saturation": -100 },
      { "lightness": 10 }
    ]
  }
]'''; // simple desaturate style to mimic grayscale-ish look

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // create markers (default colored markers)
    _markers.addAll([
      Marker(
        markerId: const MarkerId('hotel'),
        position: _hotelLatLng,
        infoWindow: const InfoWindow(title: 'Hotel name', snippet: 'Budget Double Room'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: const MarkerId('you'),
        position: _youLatLng,
        infoWindow: const InfoWindow(title: 'You'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
    ]);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // apply style
    _mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.black100,
      body: SafeArea(
        child: Stack(
          children: [
            // ======= REPLACE image with actual GoogleMap widget =======
            Positioned.fill(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    (_hotelLatLng.latitude + _youLatLng.latitude) / 2,
                    (_hotelLatLng.longitude + _youLatLng.longitude) / 2,
                  ),
                  zoom: 15,
                ),
                markers: _markers,
                myLocationEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                compassEnabled: false,
              ),
            ),

            // Back button (same as before)
            Positioned(
              top: BSizes.top,
              left: BSizes.left,
              child: GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back, size: 20),
                ),
              ),
            ),

            // Zoom controls overlay (these can call _mapController.animateCamera to zoom)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              left: BSizes.leftSide,
              child: Column(
                children: [
                  _circleIconButton(Icons.add, onTap: () {
                    _mapController.animateCamera(CameraUpdate.zoomIn());
                  }),
                  const SizedBox(height: 10),
                  _circleIconButton(Icons.remove, onTap: () {
                    _mapController.animateCamera(CameraUpdate.zoomOut());
                  }),
                ],
              ),
            ),

            // Top info card (unchanged)
            Positioned(
              top: 36,
              left: 24,
              right: 24,
              child: Container(
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: BAppColors.black10000,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // logo container
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(BImages.hotel, fit: BoxFit.contain),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hotel name', style: BAppStyles.poppins(color: Colors.white, fontSize: 18, weight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text('Budget Double Room', style: BAppStyles.poppins(color: Colors.white70, fontSize: 12, weight: FontWeight.w500)),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('2.7 km', style: BAppStyles.poppins(color: Colors.white, fontSize: 18, weight: FontWeight.w700)),
                        const SizedBox(width: 12),
                        Text('2h', style: BAppStyles.poppins(color: Colors.white70, fontSize: 12, weight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // The rest of your overlays (user bubble, bottom nav etc.) remain the same...
            // small 'You' callout (example)
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width * 0.18,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: BAppColors.black10000,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text('You', style: BAppStyles.poppins(color: Colors.white, fontSize: 14, weight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIconButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
