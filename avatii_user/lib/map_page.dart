// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   static const LatLng _pConnaughtPlace = LatLng(28.6295076, 77.215297);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(initialCameraPosition: CameraPosition(target: _pConnaughtPlace, zoom: 13)),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart'; // Import the location package

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  LatLng? _currentLocation; // To store the user's current location
  final Location _locationService = Location();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Method to get the user's current location
  Future<void> _getUserLocation() async {
    final bool serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      final bool serviceRequested = await _locationService.requestService();
      if (!serviceRequested) return;
    }

    PermissionStatus permissionGranted = await _locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    final LocationData locationData = await _locationService.getLocation();

    setState(() {
      _currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator()) // Show loading while location is being fetched
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 15, // Adjust zoom level to your preference
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
    );
  }
}
