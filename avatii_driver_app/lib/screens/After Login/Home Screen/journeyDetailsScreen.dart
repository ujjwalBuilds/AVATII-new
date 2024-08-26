// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:geocoding/geocoding.dart';

// // class JourneyDetailsScreen extends StatefulWidget {
// //   final Journey? journey;
// //   final Driver? driver;
// //   final Map<String, double> currentLocation;
// //   final LatLng? destinationCoordinates;

// //   const JourneyDetailsScreen({Key? key, required this.currentLocation, required this.destinationCoordinates}) : super(key: key);

// //   @override
// //   _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
// // }

// // class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
// //   GoogleMapController? _mapController;
// //   Set<Polyline> _polylines = {};
// //   String pickupAddress = '';
// //   String dropoffAddress = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _createPolylines();
// //     _getAddresses();
// //   }

// //   Future<void> _createPolylines() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;

// //     LatLng pickOffLatLng = LatLng(
// //       pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //       pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //     );

// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     print("Pickup Coordinates: $pickOffLatLng"); // Debugging
// //     print("Dropoff Coordinates: $dropOffLatLng"); // Debugging

// //     PolylinePoints polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ',
// //       request: PolylineRequest(
// //         origin: PointLatLng(pickOffLatLng.latitude, pickOffLatLng.longitude),
// //         destination: PointLatLng(dropOffLatLng.latitude, dropOffLatLng.longitude),
// //         mode: TravelMode.driving,
// //       ),
// //     );

// //     List<LatLng> polylineCoordinates = [];

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //       print("Polyline Points: $polylineCoordinates"); // Debugging
// //     } else {
// //       print("No polyline points found!"); // Debugging
// //     }

// //     setState(() {
// //       _polylines.add(
// //         Polyline(
// //           polylineId: PolylineId('route'),
// //           points: polylineCoordinates,
// //           color: Colors.black,
// //           width: 5,
// //         ),
// //       );
// //     });

// //     // Center the map to show the route
// //     _mapController?.animateCamera(
// //       CameraUpdate.newLatLngBounds(
// //         LatLngBounds(
// //           southwest: pickOffLatLng,
// //           northeast: dropOffLatLng,
// //         ),
// //         100.0,
// //       ),
// //     );
// //   }

// //   Future<void> _getAddresses() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     try {
// //       List<Placemark> pickupPlacemarks = await placemarkFromCoordinates(
// //         pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //         pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //       );

// //       List<Placemark> dropoffPlacemarks = await placemarkFromCoordinates(
// //         dropOffLatLng.latitude,
// //         dropOffLatLng.longitude,
// //       );

// //       setState(() {
// //         pickupAddress = '${pickupPlacemarks[0].name}, ${pickupPlacemarks[0].locality},${pickupPlacemarks[0].postalCode} ';
// //         dropoffAddress = '${dropoffPlacemarks[0].name}, ${dropoffPlacemarks[0].locality},${dropoffPlacemarks[0].postalCode} ';
// //         // "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}"
// //       });
// //     } catch (e) {
// //       print('Error getting addresses: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
// //     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Google Map
// //           Positioned.fill(
// //             child: GoogleMap(
// //               onMapCreated: (controller) {
// //                 _mapController = controller;
// //               },
// //               initialCameraPosition: CameraPosition(
// //                 target: LatLng(pickoffLatitude, pickoffLongitude),
// //                 zoom: 12.0,
// //               ),
// //               markers: {
// //                 Marker(
// //                   markerId: MarkerId('pickup'),
// //                   position: LatLng(
// //                     pickOffCoordinates?.latitude ?? pickoffLatitude,
// //                     pickOffCoordinates?.longitude ?? pickoffLongitude,
// //                   ),
// //                   infoWindow: InfoWindow(title: 'Pickup Location'),
// //                 ),
// //                 Marker(
// //                   markerId: MarkerId('dropoff'),
// //                   position: dropOffLatLng,
// //                   infoWindow: InfoWindow(title: 'Dropoff Location'),
// //                 ),
// //               },
// //               polylines: _polylines,
// //             ),
// //           ),
// //           // Bottom Container for Driver Details

// //         Positioned(
// //   bottom: 0,
// //   left: 0,
// //   right: 0,
// //   child: Container(
// //     height: MediaQuery.of(context).size.height * 0.4,
// //     decoration: BoxDecoration(
// //       color: const Color(0xFFF2F2F5),
// //       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
// //     ),
// //     child: Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         children: [
// //           Text(
// //             'Driver is on the way',
// //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //           ),
// //           Divider(indent: 17, endIndent: 17, color: Colors.grey.shade300),
// //           Row(
// //             children: [
// // Stack(
// //   alignment: Alignment.bottomLeft,
// //   children: [
// //     Image.asset(
// //       'assets/images/sedan_image.png',
// //       width: 100,
// //       height: 100,
// //     ),
// //     Positioned(
// //       top: 0,
// //       left: 0,
// //       child: CircleAvatar(
// //         radius: 20,
// //         backgroundColor: Colors.red.shade900, // Dark red background
// //         child: CircleAvatar(
// //           radius: 19,
// //           backgroundImage: AssetImage('assets/images/profile_image.png'),
// //         ),
// //       ),
// //     ),
// //   ],
// // ),
// //               // SizedBox(width: 5),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     RichText(
// //                       text: TextSpan(
// //                         style: TextStyle(color: Colors.black, fontSize: 16),
// //                         children: [
// //                           TextSpan(text: 'Pickup: ', style: TextStyle(fontWeight: FontWeight.bold)),
// //                           TextSpan(text: '$pickupAddress'),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(height: 10),
// //                     RichText(
// //                       text: TextSpan(
// //                         style: TextStyle(color: Colors.black, fontSize: 16),
// //                         children: [
// //                           TextSpan(text: 'Dropoff: ', style: TextStyle(fontWeight: FontWeight.bold)),
// //                           TextSpan(text: '$dropoffAddress'),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           SizedBox(height: 20),
// //           RichText(
// //             text: TextSpan(
// //               style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
// //               children: [
// //                 TextSpan(text: 'OTP: '),
// //                 TextSpan(text: widget.journey?.otp.toString() ?? "ERROR"),
// //               ],
// //             ),
// //           ),
// //           SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: () {},
// //             style: ElevatedButton.styleFrom(
// //               minimumSize: Size(double.infinity, 50),
// //               backgroundColor: Colors.black,
// //             ),
// //             child: Text('CALL DRIVER', style: TextStyle(color: Colors.white)),
// //           ),
// //           SizedBox(height: 10),
// //           ElevatedButton(
// //             onPressed: () {},
// //             style: ElevatedButton.styleFrom(
// //               minimumSize: Size(double.infinity, 50),
// //               backgroundColor: Colors.white,
// //             ),
// //             child: Text('CANCEL RIDE', style: TextStyle(color: Colors.red)),
// //           ),
// //         ],
// //       ),
// //     ),
// //   ),
// // ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// // import 'package:avatii/constants/imageStrings.dart';
// // import 'package:avatii/models/driver_model.dart';
// // import 'package:avatii/models/journeyModel.dart' as journey;
// // import 'package:avatii/models/journeyModel.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:geocoding/geocoding.dart';

// // class JourneyDetailsScreen extends StatefulWidget {
// //   final Journey? journey;
// //   final Driver? driver;
// //   final Map<String, double> currentLocation;
// //   final LatLng? destinationCoordinates;

// //   const JourneyDetailsScreen({
// //     Key? key,
// //     required this.journey,
// //     required this.driver,
// //     required this.currentLocation,
// //     this.destinationCoordinates,
// //   }) : super(key: key);

// //   @override
// //   _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
// // }

// // class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
// //   GoogleMapController? _mapController;
// //   Set<Marker> _markers = {};
// //   Set<Polyline> _polylines = {};
// //   String pickupAddress = '';
// //   String dropoffAddress = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _createPolylines();
// //     _getAddresses();
// //     _setMarkers();
// //   }

// //   Future<void> _createPolylines() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;

// //     LatLng pickOffLatLng = LatLng(
// //       pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //       pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //     );

// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     PolylinePoints polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ',
// //       request: PolylineRequest(
// //         origin: PointLatLng(pickOffLatLng.latitude, pickOffLatLng.longitude),
// //         destination: PointLatLng(dropOffLatLng.latitude, dropOffLatLng.longitude),
// //         mode: TravelMode.driving,
// //       ),
// //     );

// //     List<LatLng> polylineCoordinates = [];

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     }

// //     setState(() {
// //       _polylines.add(
// //         Polyline(
// //           polylineId: PolylineId('route'),
// //           points: polylineCoordinates,
// //           color: Colors.black,
// //           width: 5,
// //         ),
// //       );
// //     });

// //     // Center the map to show the route and adjust for the bottom container
// //     _mapController?.animateCamera(
// //       CameraUpdate.newLatLngBounds(
// //         LatLngBounds(
// //           southwest: LatLng(
// //             pickOffLatLng.latitude - 0.005, // Adjust for bottom container
// //             pickOffLatLng.longitude,
// //           ),
// //           northeast: LatLng(
// //             dropOffLatLng.latitude + 0.005, // Adjust for bottom container
// //             dropOffLatLng.longitude,
// //           ),
// //         ),
// //         100.0,
// //       ),
// //     );
// //   }

// //   Future<void> _getAddresses() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     try {
// //       List<Placemark> pickupPlacemarks = await placemarkFromCoordinates(
// //         pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //         pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //       );

// //       List<Placemark> dropoffPlacemarks = await placemarkFromCoordinates(
// //         dropOffLatLng.latitude,
// //         dropOffLatLng.longitude,
// //       );

// //       setState(() {
// //         pickupAddress = '${pickupPlacemarks[0].name}, ${pickupPlacemarks[0].locality},${pickupPlacemarks[0].postalCode} ';
// //         dropoffAddress = '${dropoffPlacemarks[0].name}, ${dropoffPlacemarks[0].locality},${dropoffPlacemarks[0].postalCode} ';
// //       });
// //     } catch (e) {
// //       print('Error getting addresses: $e');
// //     }
// //   }

// //   Future<BitmapDescriptor> _createCustomMarker(String assetPath) async {
// //     return await BitmapDescriptor.fromAssetImage(
// //       ImageConfiguration(size: Size(48, 48)), // Adjust size as needed
// //       assetPath,
// //     );
// //   }

// //   Future<void> _setMarkers() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
// //     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     BitmapDescriptor dropOffMarker = await _createCustomMarker('assets/images/car-icon.png');

// //     setState(() {
// //       _markers.add(
// //         Marker(
// //           markerId: MarkerId('pickup'),
// //           position: LatLng(
// //             pickOffCoordinates?.latitude ?? pickoffLatitude,
// //             pickOffCoordinates?.longitude ?? pickoffLongitude,
// //           ),
// //           infoWindow: InfoWindow(title: 'Pickup Location'),
// //         ),
// //       );

// //       _markers.add(
// //         Marker(
// //           markerId: MarkerId('dropoff'),
// //           position: dropOffLatLng,
// //           icon: dropOffMarker, // Custom marker icon
// //           infoWindow: InfoWindow(title: 'Dropoff Location'),
// //         ),
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
// //     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Google Map
// //           Positioned.fill(
// //             child: GoogleMap(
// //               onMapCreated: (controller) {
// //                 _mapController = controller;
// //               },
// //               initialCameraPosition: CameraPosition(
// //                 target: LatLng(pickoffLatitude, pickoffLongitude),
// //                 zoom: 17.0,
// //               ),
// //               markers: _markers,
// //               polylines: _polylines,
// //             ),
// //           ),
// //           // Bottom Container for Driver Details
// //           Positioned(
// //             bottom: 0,
// //             left: 0,
// //             right: 0,
// //             child: Container(
// //               height: MediaQuery.of(context).size.height * 0.4,
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFF2F2F5),
// //                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                       'Driver is on the way',
// //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                     Divider(indent: 17, endIndent: 17, color: Colors.grey.shade300),
// //                     Row(
// //                       children: [
// //                         Stack(
// //                           alignment: Alignment.bottomLeft,
// //                           children: [
// //                             Image.asset(
// //                               'assets/images/sedan_image.png',
// //                               width: 100,
// //                               height: 100,
// //                             ),
// //                             Positioned(
// //                               top: 0,
// //                               left: 0,
// //                               child: CircleAvatar(
// //                                 radius: 20,
// //                                 backgroundColor: Colors.red.shade900,
// //                                 child: CircleAvatar(
// //                                   radius: 19,
// //                                   backgroundImage: AssetImage('assets/images/profile_image.png'),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         Expanded(
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               RichText(
// //                                 text: TextSpan(
// //                                   style: TextStyle(color: Colors.black, fontSize: 16),
// //                                   children: [
// //                                     TextSpan(text: 'Pickup: ', style: TextStyle(fontWeight: FontWeight.bold)),
// //                                     TextSpan(text: '$pickupAddress'),
// //                                   ],
// //                                 ),
// //                               ),
// //                               SizedBox(height: 10),
// //                               RichText(
// //                                 text: TextSpan(
// //                                   style: TextStyle(color: Colors.black, fontSize: 16),
// //                                   children: [
// //                                     TextSpan(text: 'Drop-off: ', style: TextStyle(fontWeight: FontWeight.bold)),
// //                                     TextSpan(text: '$dropoffAddress'),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



import 'dart:async';

import 'package:avatii_driver_app/provider/JourneyProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart'hide Location;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';



class JourneyDetailsScreen extends StatefulWidget {
  final String journeyId;
  final LocationData? currentLocation;
  final data;
  final pickofflocation;
  //final dropofflocation; // Add this

  JourneyDetailsScreen({
    Key? key,
    required this.journeyId,
    required this.data,
    required this.currentLocation,
    required this.pickofflocation,
   // required this.dropofflocation, // Add this
  }) : super(key: key);

  @override
  _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
}

class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _mapController = Completer();

  bool _showArrivalButton = true;
  bool _showOtpField = false;
   late Location _locationService;
  bool _showButtonsAfterOtp = false;

  @override
  void initState() {
    super.initState();
    _locationService = Location();
    setRouteToPickupLocation(widget.pickofflocation);
  }

  Future<void> setRouteToPickupLocation(LatLng pickOffLocation) async {
    final GoogleMapController controller = await _mapController.future;
    final PolylinePoints polylinePoints = PolylinePoints();

    LatLng driverCurrentLocation =
        LatLng(widget.currentLocation!.latitude!, widget.currentLocation!.longitude!);

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ', // Replace with your actual API key
      request: PolylineRequest(
        origin: PointLatLng(driverCurrentLocation.latitude, driverCurrentLocation.longitude),
        destination: PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),
        mode: TravelMode.driving,
        avoidHighways: false,
        avoidTolls: false,
        avoidFerries: false,
      ),
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates =
          result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();

      setState(() {
        _polylines.clear();
        _markers.clear();

        _polylines.add(Polyline(
          polylineId: PolylineId('route_to_pickup'),
          color: Colors.red,
          points: polylineCoordinates,
          width: 5,
        ));

        _markers.add(Marker(
          markerId: MarkerId('start'),
          position: driverCurrentLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ));
        _markers.add(Marker(
          markerId: MarkerId('end'),
          position: pickOffLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ));
      });

      LatLngBounds bounds = LatLngBounds(
        southwest: driverCurrentLocation,
        northeast: pickOffLocation,
      );
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      print('Failed to get directions: ${result.errorMessage}');
    }
  }

  Future<void> setRouteToDropoffLocation(LatLng dropOffLocation) async {
    final GoogleMapController controller = await _mapController.future;
    final PolylinePoints polylinePoints = PolylinePoints();

    LatLng driverCurrentLocation =
        LatLng(widget.currentLocation!.latitude!, widget.currentLocation!.longitude!);

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ', // Replace with your actual API key
      request: PolylineRequest(
        origin: PointLatLng(driverCurrentLocation.latitude, driverCurrentLocation.longitude),
        destination: PointLatLng(dropOffLocation.latitude, dropOffLocation.longitude),
        mode: TravelMode.driving,
        avoidHighways: false,
        avoidTolls: false,
        avoidFerries: false,
      ),
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates =
          result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();

      setState(() {
        _polylines.clear();
        _markers.clear();

        _polylines.add(Polyline(
          polylineId: PolylineId('route_to_dropoff'),
          color: Colors.blue,
          points: polylineCoordinates,
          width: 5,
        ));

        _markers.add(Marker(
          markerId: MarkerId('start'),
          position: driverCurrentLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ));
        _markers.add(Marker(
          markerId: MarkerId('end'),
          position: dropOffLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ));
      });

      LatLngBounds bounds = LatLngBounds(
        southwest: driverCurrentLocation,
        northeast: dropOffLocation,
      );
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      print('Failed to get directions: ${result.errorMessage}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Color accentPurpleColor = Color(0xFF6A53A1);
    final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(0.0, 0.0),
                zoom: 12.0,
              ),
              markers: _markers,
              polylines: _polylines,
            ),
          ),
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
                child: _showArrivalButton
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showArrivalButton = false;
                                _showOtpField = true;
                              });
                            },
                            child: Text('Arrived'),
                          ),
                        ],
                      )
                    : journeyProvider.isvalidatingotp
                        ? CircularProgressIndicator()
                        : _showOtpField
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  OtpTextField(
                                    numberOfFields: 6,
                                    borderColor: accentPurpleColor,
                                    focusedBorderColor: accentPurpleColor,
                                    showFieldAsBox: false,
                                    borderWidth: 4.0,
                                    onSubmit: (String verificationCode) {
                                      journeyProvider.validateOTP(widget.data['journeyId'], verificationCode).then((isSuccess) {
                                        if (isSuccess) {
                                          setState(() {
                                            _showOtpField = false;
                                            _showButtonsAfterOtp = true;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )
                            : _showButtonsAfterOtp
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setRouteToDropoffLocation(widget.data['dropoff']);
                                        },
                                        child: Text('Navigate to Dropoff'),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Implement your complete journey logic here
                                        },
                                        child: Text('Complete Journey'),
                                      ),
                                    ],
                                  )
                                : Container(), // Empty container to cover other cases
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class JourneyDetailsScreen extends StatefulWidget {
//   final String journeyId;
//  final LocationData? currentLocation;
//  final data;
//  final pickofflocation;
//   JourneyDetailsScreen({Key? key, required this.journeyId,
//   required this.data,
//   required this.currentLocation,required this.pickofflocation}) : super(key: key);

//   @override
//   _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
// }

// class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
//  // GoogleMapController? _mapController;
//   Set<Polyline> _polylines = {};
//   late bool _showArrivalButton = true;
//  Set<Marker> _markers = {};
//    Completer<GoogleMapController> _mapController = Completer();
  

//   @override
//   void initState() {
//     super.initState();
//      setRouteToPickupLocation(widget.pickofflocation);
    
//     }



  
//   Future<void> setRouteToPickupLocation(LatLng pickOffLocation) async {
//     final GoogleMapController controller = await _mapController.future;
//     final PolylinePoints polylinePoints = PolylinePoints();

//     // Get the driver's current location
//     LatLng driverCurrentLocation = LatLng(widget.currentLocation!.latitude!, widget.currentLocation!.longitude!);

//     // Get route
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ', // Replace with your actual API key
//       // PointLatLng(driverCurrentLocation.latitude, driverCurrentLocation.longitude),
//       // PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),

//       // Add the request parameter
//       request: PolylineRequest(
//         origin: PointLatLng(widget.currentLocation!.latitude!, widget.currentLocation!.longitude!),
//         destination: PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),
//         mode: TravelMode.driving,
//         //transitMode:  TreavelMode,
//         avoidHighways: false,
//         avoidTolls: false,
//         avoidFerries: false,
//       ),
//     );

//     if (result.points.isNotEmpty) {
//       List<LatLng> polylineCoordinates = result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();

//       setState(() {
//         // Clear existing polylines and markers
//         _polylines.clear();
//         _markers.clear();

//         // Add new polyline
//         _polylines.add(Polyline(
//           polylineId: PolylineId('route'),
//           color: Colors.red,
//           points: polylineCoordinates,
//           width: 5,
//         ));

//         // Add markers for start and end points
//         _markers.add(Marker(
//           markerId: MarkerId('start'),
//           position: driverCurrentLocation,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//         ));
//         _markers.add(Marker(
//           markerId: MarkerId('end'),
//           position: pickOffLocation,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         ));
//       });

//       // Move camera to show the entire route
//       LatLngBounds bounds = LatLngBounds(
//         southwest: driverCurrentLocation,
//         northeast: pickOffLocation,
//       );
//       controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
//     } else {
//       print('Failed to get directions: ${result.errorMessage}');
//     }
//   }


//   // void _validateOtp() {
//   //   final otp = _otpController.text;
//   //   if (otp.isNotEmpty) {
//   //     print('Validating OTP: $otp');
//   //     // Add your OTP validation logic here
//   //     Navigator.of(context).pop(); // Close the bottom sheet after validation
//   //   } else {
//   //     print('Please enter a valid OTP');
//   //   }
//   // }


//   @override
//   Widget build(BuildContext context) {
//      bool _showArrivalButton = false;
//        Color accentPurpleColor = Color(0xFF6A53A1);
//       final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);
//     return SingleChildScrollView(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             // Your existing Google Map and other widgets
//             Positioned.fill(
//               child: GoogleMap(
//                 onMapCreated: (GoogleMapController  controller) {
//                   // Add your map initialization code
//                    _mapController.complete(controller);
//                 },
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(0.0, 0.0), // Replace with actual coordinates
//                   zoom: 12.0,
//                 ),
//                 markers: {
//                   // Add your markers
//                   Marker(
//                     markerId: MarkerId('driver marker'),
                    
//                     ),
//                   Marker(
//                     markerId: MarkerId('user marker'),
                    
//                     ),
//                 },
//                 polylines: {
//                   // Add your polylines
//                 },
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF2F2F5),
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child:_showArrivalButton? Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 _showArrivalButton = false;
//                               });
//                             },
//                             child: Text('Arrived'),
//                           ),
//                         ],
//                       ):journeyProvider.isvalidatingotp
//                       ? CircularProgressIndicator()
//                       : Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             OtpTextField(
//                               numberOfFields: 6,
//                               borderColor: accentPurpleColor,
//                               focusedBorderColor: accentPurpleColor,
//                               //  styles: otpTextStyles,
//                               showFieldAsBox: false,
//                               borderWidth: 4.0,
//                               //runs when a code is typed in

//                               //runs when every textfield is filled
//                               onSubmit: (String verificationCode) {
//                                 journeyProvider.validateOTP(widget.data['journeyId'], verificationCode);
//                               },
//                             ),
//                             SizedBox(height: 10),
                          
//                           ],
//                         ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           RichText(
//             text: TextSpan(
//               style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
//               children: [
//                 TextSpan(text: 'OTP: '),
//                 TextSpan(text: widget.journey?.otp.toString() ?? "ERROR"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:avatii/constants/imageStrings.dart';
// // import 'package:avatii/models/driver_model.dart';
// // import 'package:avatii/models/journeyModel.dart' as journey;
// // import 'package:avatii/models/journeyModel.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:geocoding/geocoding.dart';

// // class JourneyDetailsScreen extends StatefulWidget {
// //   final Journey? journey;
// //   final Driver? driver;
// //   final Map<String, double> currentLocation;
// //   final LatLng? destinationCoordinates;

// //   const JourneyDetailsScreen({
// //     Key? key,
// //     required this.journey,
// //     required this.driver,
// //     required this.currentLocation,
// //     this.destinationCoordinates,
// //   }) : super(key: key);

// //   @override
// //   _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
// // }

// // class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
// //   GoogleMapController? _mapController;
// //   Set<Marker> _markers = {};
// //   Set<Polyline> _polylines = {};
// //   String pickupAddress = '';
// //   String dropoffAddress = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _createPolylines();
// //     _getAddresses();
// //     _setMarkers();
// //   }

// //   Future<void> _createPolylines() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;

// //     LatLng pickOffLatLng = LatLng(
// //       pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //       pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //     );

// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     PolylinePoints polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ',
// //       request: PolylineRequest(
// //         origin: PointLatLng(pickOffLatLng.latitude, pickOffLatLng.longitude),
// //         destination: PointLatLng(dropOffLatLng.latitude, dropOffLatLng.longitude),
// //         mode: TravelMode.driving,
// //       ),
// //     );

// //     List<LatLng> polylineCoordinates = [];

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     }

// //     setState(() {
// //       _polylines.add(
// //         Polyline(
// //           polylineId: PolylineId('route'),
// //           points: polylineCoordinates,
// //           color: Colors.black,
// //           width: 5,
// //         ),
// //       );
// //     });

// //     // Center the map to show the route and adjust for the bottom container
// //     _mapController?.animateCamera(
// //       CameraUpdate.newLatLngBounds(
// //         LatLngBounds(
// //           southwest: LatLng(
// //             pickOffLatLng.latitude - 0.005, // Adjust for bottom container
// //             pickOffLatLng.longitude,
// //           ),
// //           northeast: LatLng(
// //             dropOffLatLng.latitude + 0.005, // Adjust for bottom container
// //             dropOffLatLng.longitude,
// //           ),
// //         ),
// //         100.0,
// //       ),
// //     );
// //   }

// //   Future<void> _getAddresses() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     try {
// //       List<Placemark> pickupPlacemarks = await placemarkFromCoordinates(
// //         pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //         pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //       );

// //       List<Placemark> dropoffPlacemarks = await placemarkFromCoordinates(
// //         dropOffLatLng.latitude,
// //         dropOffLatLng.longitude,
// //       );

// //       setState(() {
// //         pickupAddress = '${pickupPlacemarks[0].name}, ${pickupPlacemarks[0].locality},${pickupPlacemarks[0].postalCode} ';
// //         dropoffAddress = '${dropoffPlacemarks[0].name}, ${dropoffPlacemarks[0].locality},${dropoffPlacemarks[0].postalCode} ';
// //       });
// //     } catch (e) {
// //       print('Error getting addresses: $e');
// //     }
// //   }

// //   Future<BitmapDescriptor> _createCustomMarker(String assetPath) async {
// //     return await BitmapDescriptor.fromAssetImage(
// //       ImageConfiguration(size: Size(48, 48)), // Adjust size as needed
// //       assetPath,
// //     );
// //   }

// //   Future<void> _setMarkers() async {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
// //     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

// //     LatLng dropOffLatLng = widget.destinationCoordinates ??
// //         LatLng(
// //           widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
// //           widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
// //         );

// //     BitmapDescriptor dropOffMarker = await _createCustomMarker('assets/images/car-icon.png');

// //     setState(() {
// //       _markers.add(
// //         Marker(
// //           markerId: MarkerId('pickup'),
// //           position: LatLng(
// //             pickOffCoordinates?.latitude ?? pickoffLatitude,
// //             pickOffCoordinates?.longitude ?? pickoffLongitude,
// //           ),
// //           infoWindow: InfoWindow(title: 'Pickup Location'),
// //         ),
// //       );

// //       _markers.add(
// //         Marker(
// //           markerId: MarkerId('dropoff'),
// //           position: dropOffLatLng,
// //           icon: dropOffMarker, // Custom marker icon
// //           infoWindow: InfoWindow(title: 'Dropoff Location'),
// //         ),
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     journey.Location? pickOffCoordinates = widget.journey?.pickOff;
// //     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
// //     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Google Map
// //           Positioned.fill(
// //             child: GoogleMap(
// //               onMapCreated: (controller) {
// //                 _mapController = controller;
// //               },
// //               initialCameraPosition: CameraPosition(
// //                 target: LatLng(pickoffLatitude, pickoffLongitude),
// //                 zoom: 17.0,
// //               ),
// //               markers: _markers,
// //               polylines: _polylines,
// //             ),
// //           ),
// //           // Bottom Container for Driver Details
// //           Positioned(
// //             bottom: 0,
// //             left: 0,
// //             right: 0,
// //             child: Container(
// //               height: MediaQuery.of(context).size.height * 0.4,
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFF2F2F5),
// //                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                       'Driver is on the way',
// //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                     Divider(indent: 17, endIndent: 17, color: Colors.grey.shade300),
// //                     Row(
// //                       children: [
// //                         Stack(
// //                           alignment: Alignment.bottomLeft,
// //                           children: [
// //                             Image.asset(
// //                               'assets/images/sedan_image.png',
// //                               width: 100,
// //                               height: 100,
// //                             ),
// //                             Positioned(
// //                               top: 0,
// //                               left: 0,
// //                               child: CircleAvatar(
// //                                 radius: 20,
// //                                 backgroundColor: Colors.red.shade900,
// //                                 child: CircleAvatar(
// //                                   radius: 19,
// //                                   backgroundImage: AssetImage('assets/images/profile_image.png'),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         Expanded(
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               RichText(
// //                                 text: TextSpan(
// //                                   style: TextStyle(color: Colors.black, fontSize: 16),
// //                                   children: [
// //                                     TextSpan(text: 'Pickup: ', style: TextStyle(fontWeight: FontWeight.bold)),
// //                                     TextSpan(text: '$pickupAddress'),
// //                                   ],
// //                                 ),
// //                               ),
// //                               SizedBox(height: 10),
// //                               RichText(
// //                                 text: TextSpan(
// //                                   style: TextStyle(color: Colors.black, fontSize: 16),
// //                                   children: [
// //                                     TextSpan(text: 'Drop-off: ', style: TextStyle(fontWeight: FontWeight.bold)),
// //                                     TextSpan(text: '$dropoffAddress'),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class JourneyDetailsScreen extends StatefulWidget {
  final String journeyId;
  final LocationData? currentLocation;

  JourneyDetailsScreen({Key? key, required this.journeyId, required this.currentLocation}) : super(key: key);

  @override
  _JourneyDetailsScreenState createState() => _JourneyDetailsScreenState();
}

class _JourneyDetailsScreenState extends State<JourneyDetailsScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  Set<Polyline> _polylines = {};
  late bool _showArrivalButton = true;

  @override
  void initState() {
    super.initState();
    _createPolylines();
    // Add initialization if needed
  }


  // void _showArrivalBottomSheet(String journeyId) {
  //   showModalBottomSheet(
  //     context: context,
  //     isDismissible: false,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setState) {
  //           final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);
  //           return Container(
  //             padding: EdgeInsets.all(20.0),
  //             child: _showArrivalButton
  //                 ? Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           setState(() {
  //                             _showArrivalButton = false;
  //                           });
  //                         },
  //                         child: Text('Arrived'),
  //                       ),
  //                     ],
  //                   )
  //                 : journeyProvider.isValidatingOtp
  //                     ? CircularProgressIndicator()
  //                     : Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           OtpTextField(
  //                             numberOfFields: 6,
  //                             borderColor: Colors.purple,
  //                             focusedBorderColor: Colors.purple,
  //                             showFieldAsBox: false,
  //                             borderWidth: 4.0,
  //                             onSubmit: (String verificationCode) {
  //                               journeyProvider.validateOTP(widget.journeyId, verificationCode);
  //                             },
  //                           ),
  //                           SizedBox(height: 10),
  //                           ElevatedButton(
  //                             onPressed: () {
  //                               // Implement OTP validation
  //                             },
  //                             child: Text('Validate OTP'),
  //                           ),
  //                         ],
  //                       ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Future<void> setRouteToPickupLocation(LatLng pickOffLocation) async {
    final GoogleMapController? controller = await _mapController?.future!;
    final PolylinePoints polylinePoints = PolylinePoints();

    // Get the driver's current location
    LatLng driverCurrentLocation = LatLng(widget.currentLocation!.latitude!, widget.currentLocation!.longitude!);

    // Get route
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ', // Replace with your actual API key
      // PointLatLng(driverCurrentLocation.latitude, driverCurrentLocation.longitude),
      // PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),

      // Add the request parameter
      request: PolylineRequest(
        origin: PointLatLng(widget.currentLocation!.latitude!, widget.currentLocation!.longitude!),
        destination: PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),
        mode: TravelMode.driving,
        //transitMode:  TreavelMode,
        avoidHighways: false,
        avoidTolls: false,
        avoidFerries: false,
      ),
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();

      setState(() {
        // Clear existing polylines and markers
        _polylines.clear();
        _markers.clear();

        // Add new polyline
        _polylines.add(Polyline(
          polylineId: PolylineId('route'),
          color: Colors.red,
          points: polylineCoordinates,
          width: 5,
        ));

        // Add markers for start and end points
        _markers.add(Marker(
          markerId: MarkerId('start'),
          position: driverCurrentLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ));
        _markers.add(Marker(
          markerId: MarkerId('end'),
          position: pickOffLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ));
      });

      // Move camera to show the entire route
      LatLngBounds bounds = LatLngBounds(
        southwest: driverCurrentLocation,
        northeast: pickOffLocation,
      );
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      print('Failed to get directions: ${result.errorMessage}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your existing Google Map and other widgets
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: (controller) {
                // Add your map initialization code
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(0.0, 0.0), // Replace with actual coordinates
                zoom: 12.0,
              ),
              markers: {
                // Add your markers
                Marker(
                  markerId: MarkerId('driver marker'),
                ),
                Marker(
                  markerId: MarkerId('user marker'),
                ),
              },
              polylines: {
                // Add your polylines
              },
            ),
          ),
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
                    // Your existing widgets
                    ElevatedButton(
                      onPressed: () => _showArrivalBottomSheet(widget.journeyId),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                      ),
                      child: Text('CALL DRIVER', style: TextStyle(color: Colors.white)),
                    ),
                    // Add more buttons if needed
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
