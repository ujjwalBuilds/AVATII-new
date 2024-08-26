import 'package:avatii/models/driver_model.dart';
import 'package:avatii/models/journeyModel.dart' as journey;
import 'package:avatii/models/journeyModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';

class DriverDetailsScreen extends StatefulWidget {
  final Journey? journey;
  final Driver? driver;
  final Map<String, double> currentLocation;
  final LatLng? destinationCoordinates;

  const DriverDetailsScreen({
    Key? key,
    required this.journey,
    required this.driver,
    required this.currentLocation,
    this.destinationCoordinates,
  }) : super(key: key);

  @override
  _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  String pickupAddress = '';
  String dropoffAddress = '';

  @override
  void initState() {
    super.initState();
    _createPolylines();
    _getAddresses();
  }

  Future<void> _createPolylines() async {
    journey.Location? pickOffCoordinates = widget.journey?.pickOff;

    LatLng pickOffLatLng = LatLng(
      pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
      pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
    );

    LatLng dropOffLatLng = widget.destinationCoordinates ??
        LatLng(
          widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
          widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
        );

    print("Pickup Coordinates: $pickOffLatLng"); // Debugging
    print("Dropoff Coordinates: $dropOffLatLng"); // Debugging

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ',
      request:  PolylineRequest(
        origin: PointLatLng(pickOffLatLng.latitude, pickOffLatLng.longitude),
        destination: PointLatLng(dropOffLatLng.latitude, dropOffLatLng.longitude),
        mode: TravelMode.driving,
      ),
    );

    List<LatLng> polylineCoordinates = [];

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      print("Polyline Points: $polylineCoordinates"); // Debugging
    } else {
      print("No polyline points found!"); // Debugging
    }

    setState(() {
      _polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          points: polylineCoordinates,
          color: Colors.black,
          width: 5,
        ),
      );
    });

    // Center the map to show the route
    _mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: pickOffLatLng,
          northeast: dropOffLatLng,
        ),
        100.0,
      ),
    );
  }

  Future<void> _getAddresses() async {
    journey.Location? pickOffCoordinates = widget.journey?.pickOff;
    LatLng dropOffLatLng = widget.destinationCoordinates ??
        LatLng(
          widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
          widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
        );

    try {
      List<Placemark> pickupPlacemarks = await placemarkFromCoordinates(
        pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
        pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
      );

      List<Placemark> dropoffPlacemarks = await placemarkFromCoordinates(
        dropOffLatLng.latitude,
        dropOffLatLng.longitude,
      );

      setState(() {
        pickupAddress = '${pickupPlacemarks[0].name}, ${pickupPlacemarks[0].locality},${pickupPlacemarks[0].postalCode} ';
        dropoffAddress = '${dropoffPlacemarks[0].name}, ${dropoffPlacemarks[0].locality},${dropoffPlacemarks[0].postalCode} ';
        // "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}"
      });
    } catch (e) {
      print('Error getting addresses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    journey.Location? pickOffCoordinates = widget.journey?.pickOff;
    double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
    double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

    LatLng dropOffLatLng = widget.destinationCoordinates ??
        LatLng(
          widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
          widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
        );

    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          Positioned.fill(
            child: GoogleMap( 
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(pickoffLatitude, pickoffLongitude),
                zoom: 17.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('pickup'),
                  position: LatLng(
                    pickOffCoordinates?.latitude ?? pickoffLatitude,
                    pickOffCoordinates?.longitude ?? pickoffLongitude,
                  ),
                  infoWindow: InfoWindow(title: 'Pickup Location'),
                ),
                Marker(
                  markerId: MarkerId('dropoff'),
                  position: dropOffLatLng,
                  infoWindow: InfoWindow(title: 'Dropoff Location'),
                ),
              },
              polylines: _polylines,
            ),
          ),
          // Bottom Container for Driver Details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4, // 40% of the screen height
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F5),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Journey ID: ${widget.journey?.id}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Driver: ${widget.driver?.name}'),
                    Text('Phone: ${widget.driver?.phoneNumber}'),
                    Text('Car: BMW'),
                    Text('Pickup: $pickupAddress'),
                    Text('Dropoff: $dropoffAddress'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                        elevation: 1,
                      ),
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

