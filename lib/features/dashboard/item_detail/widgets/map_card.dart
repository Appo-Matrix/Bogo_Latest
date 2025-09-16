import 'package:bogo_latest/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapCard extends StatefulWidget {
  const MapCard({super.key});

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  bool _locationGranted = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.location.request();
    if (status.isGranted) setState(() => _locationGranted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        Container(
          margin: const EdgeInsets.only(left: 60, top: 10),
          height: 189,
          decoration: BoxDecoration(
            color: BAppColors.black600,
            borderRadius: BorderRadius.circular(35),
          ),
          clipBehavior: Clip.antiAlias,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(35.9208, 74.3089),
              zoom: 12,
            ),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            myLocationEnabled: _locationGranted,
          ),
        ),
        Positioned(
          left: 0,
          top: 90,
          child: Container(
            height: 92,
            width: 163,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(35)),
            child: const Center(
              child: Text("2.7 km",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
    );
  }
}
