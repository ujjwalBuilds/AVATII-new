import 'package:avatii/constants/imageStrings.dart';
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

  const DriverDetailsScreen({Key? key, required this.journey, required this.driver, required this.currentLocation, required this.destinationCoordinates}) : super(key: key);

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
      request: PolylineRequest(
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
                zoom: 12.0,
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
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F5),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Driver is on the way',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Divider(indent: 17, endIndent: 17, color: Colors.grey.shade300),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.asset(
                              'assets/images/sedan_image.png',
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red.shade900, // Dark red background
                                child: CircleAvatar(
                                  radius: 19,
                                  backgroundImage: AssetImage('assets/images/profile_image.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(text: 'Pickup: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: '$pickupAddress'),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(text: 'Dropoff: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: '$dropoffAddress'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: 'OTP: '),
                          TextSpan(text: widget.journey?.otp.toString() ?? "ERROR"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                      ),
                      child: Text('CALL DRIVER', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.white,
                      ),
                      child: Text('CANCEL RIDE', style: TextStyle(color: Colors.red)),
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


// import 'package:avatii/constants/imageStrings.dart';
// import 'package:avatii/models/driver_model.dart';
// import 'package:avatii/models/journeyModel.dart' as journey;
// import 'package:avatii/models/journeyModel.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geocoding/geocoding.dart';

// class DriverDetailsScreen extends StatefulWidget {
//   final Journey? journey;
//   final Driver? driver;
//   final Map<String, double> currentLocation;
//   final LatLng? destinationCoordinates;

//   const DriverDetailsScreen({
//     Key? key,
//     required this.journey,
//     required this.driver,
//     required this.currentLocation,
//     this.destinationCoordinates,
//   }) : super(key: key);

//   @override
//   _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
// }

// class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
//   GoogleMapController? _mapController;
//   Set<Marker> _markers = {};
//   Set<Polyline> _polylines = {};
//   String pickupAddress = '';
//   String dropoffAddress = '';

//   @override
//   void initState() {
//     super.initState();
//     _createPolylines();
//     _getAddresses();
//     _setMarkers();
//   }

//   Future<void> _createPolylines() async {
//     journey.Location? pickOffCoordinates = widget.journey?.pickOff;

//     LatLng pickOffLatLng = LatLng(
//       pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
//       pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
//     );

//     LatLng dropOffLatLng = widget.destinationCoordinates ??
//         LatLng(
//           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
//           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
//         );

//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ',
//       request: PolylineRequest(
//         origin: PointLatLng(pickOffLatLng.latitude, pickOffLatLng.longitude),
//         destination: PointLatLng(dropOffLatLng.latitude, dropOffLatLng.longitude),
//         mode: TravelMode.driving,
//       ),
//     );

//     List<LatLng> polylineCoordinates = [];

//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }

//     setState(() {
//       _polylines.add(
//         Polyline(
//           polylineId: PolylineId('route'),
//           points: polylineCoordinates,
//           color: Colors.black,
//           width: 5,
//         ),
//       );
//     });

//     // Center the map to show the route and adjust for the bottom container
//     _mapController?.animateCamera(
//       CameraUpdate.newLatLngBounds(
//         LatLngBounds(
//           southwest: LatLng(
//             pickOffLatLng.latitude - 0.005, // Adjust for bottom container
//             pickOffLatLng.longitude,
//           ),
//           northeast: LatLng(
//             dropOffLatLng.latitude + 0.005, // Adjust for bottom container
//             dropOffLatLng.longitude,
//           ),
//         ),
//         100.0,
//       ),
//     );
//   }

//   Future<void> _getAddresses() async {
//     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
//     LatLng dropOffLatLng = widget.destinationCoordinates ??
//         LatLng(
//           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
//           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
//         );

//     try {
//       List<Placemark> pickupPlacemarks = await placemarkFromCoordinates(
//         pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
//         pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
//       );

//       List<Placemark> dropoffPlacemarks = await placemarkFromCoordinates(
//         dropOffLatLng.latitude,
//         dropOffLatLng.longitude,
//       );

//       setState(() {
//         pickupAddress = '${pickupPlacemarks[0].name}, ${pickupPlacemarks[0].locality},${pickupPlacemarks[0].postalCode} ';
//         dropoffAddress = '${dropoffPlacemarks[0].name}, ${dropoffPlacemarks[0].locality},${dropoffPlacemarks[0].postalCode} ';
//       });
//     } catch (e) {
//       print('Error getting addresses: $e');
//     }
//   }

//   Future<BitmapDescriptor> _createCustomMarker(String assetPath) async {
//     return await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(size: Size(48, 48)), // Adjust size as needed
//       assetPath,
//     );
//   }

//   Future<void> _setMarkers() async {
//     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
//     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
//     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

//     LatLng dropOffLatLng = widget.destinationCoordinates ??
//         LatLng(
//           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
//           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
//         );

//     BitmapDescriptor dropOffMarker = await _createCustomMarker('assets/images/car-icon.png');

//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: MarkerId('pickup'),
//           position: LatLng(
//             pickOffCoordinates?.latitude ?? pickoffLatitude,
//             pickOffCoordinates?.longitude ?? pickoffLongitude,
//           ),
//           infoWindow: InfoWindow(title: 'Pickup Location'),
//         ),
//       );

//       _markers.add(
//         Marker(
//           markerId: MarkerId('dropoff'),
//           position: dropOffLatLng,
//           icon: dropOffMarker, // Custom marker icon
//           infoWindow: InfoWindow(title: 'Dropoff Location'),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
//     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
//     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Google Map
//           Positioned.fill(
//             child: GoogleMap(
//               onMapCreated: (controller) {
//                 _mapController = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(pickoffLatitude, pickoffLongitude),
//                 zoom: 17.0,
//               ),
//               markers: _markers,
//               polylines: _polylines,
//             ),
//           ),
//           // Bottom Container for Driver Details
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.4,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF2F2F5),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Driver is on the way',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Divider(indent: 17, endIndent: 17, color: Colors.grey.shade300),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: Alignment.bottomLeft,
//                           children: [
//                             Image.asset(
//                               'assets/images/sedan_image.png',
//                               width: 100,
//                               height: 100,
//                             ),
//                             Positioned(
//                               top: 0,
//                               left: 0,
//                               child: CircleAvatar(
//                                 radius: 20,
//                                 backgroundColor: Colors.red.shade900,
//                                 child: CircleAvatar(
//                                   radius: 19,
//                                   backgroundImage: AssetImage('assets/images/profile_image.png'),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(color: Colors.black, fontSize: 16),
//                                   children: [
//                                     TextSpan(text: 'Pickup: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                                     TextSpan(text: '$pickupAddress'),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(color: Colors.black, fontSize: 16),
//                                   children: [
//                                     TextSpan(text: 'Drop-off: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                                     TextSpan(text: '$dropoffAddress'),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
