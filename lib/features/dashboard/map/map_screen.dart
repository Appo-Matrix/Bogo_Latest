import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _mapController;
  bool _isLocationPermissionGranted = true;
  bool _isMapCreated = false;
  LatLng _currentPosition =  LatLng(37.7749, -122.4194); // Default SF
  StreamSubscription<Position>? _positionStream;
  Marker? _userMarker;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLocationServices();
    });
  }

  /// ✅ Check GPS / Location services
  Future<void> _checkLocationServices() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Location services (GPS) are disabled.'),
            action: SnackBarAction(
              label: 'SETTINGS',
              onPressed: () => Geolocator.openLocationSettings(),
            ),
            duration: const Duration(seconds: 5),
          ),
        );
      }
      return;
    }
    _requestLocationPermission();
  }

  /// ✅ Request permission
  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _isLocationPermissionGranted = status.isGranted;
    });

    if (status.isGranted) {
      _startLiveLocationTracking();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Location permission is required'),
          action: SnackBarAction(
            label: 'SETTINGS',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  /// ✅ Live location tracking
  void _startLiveLocationTracking() {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      final newPos = LatLng(position.latitude, position.longitude);
      setState(() {
        _currentPosition = newPos;
        _userMarker = Marker(
          markerId: const MarkerId('user_marker'),
          position: newPos,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: const InfoWindow(title: 'You are here'),
        );
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(_currentPosition),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _isMapCreated = true;
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _currentPosition, zoom: 14),
            myLocationEnabled: false, // We use custom marker instead
            markers: _userMarker != null ? {_userMarker!} : {},
            myLocationButtonEnabled: true,
          ),
          if (!_isMapCreated)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}