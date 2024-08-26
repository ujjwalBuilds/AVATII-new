// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DriverDetailsScreen extends StatefulWidget {
//   final String journeyId;
//   final String driverId;

//   const DriverDetailsScreen({
//     Key? key,
//     required this.journeyId,
//     required this.driverId,
//   }) : super(key: key);

//   @override
//   _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
// }

// class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
//   GoogleMapController? _mapController;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final rideProvider = Provider.of<UserProvider>(context, listen: false);
//     await rideProvider.fetchJourneyDetails(widget.journeyId);
//     await rideProvider.fetchDriverDetails(widget.driverId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // 60% of the screen for Google Map
//           Expanded(
//             flex: 6,
//             child: GoogleMap(
//               onMapCreated: (controller) {
//                 _mapController = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(37.7749, -122.4194), // Set initial position here
//                 zoom: 14,
//               ),
//               // Add markers, polylines, etc. as needed
//             ),
//           ),
//           // 40% of the screen for Driver Details
//           Expanded(
//             flex: 4,
//             child: Consumer<UserProvider>(
//               builder: (context, rideProvider, child) {
//                 final journey = rideProvider.journey;
//                 final driver = rideProvider.driver;
//                 if (journey == null || driver == null) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return Container(
//                   color: const Color(0xFFF2F2F5),
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Journey ID: ${journey.id}', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 8),
//                       Text('Driver Name: ${driver.name}', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 8),
//                       Text('Phone: ${driver.phoneNumber}', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 8),
//                       Text('Car: ${driver.car}', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 8),
//                       Text('Pickup Location: ${journey.pickOff}', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 8),
//                       Text('Dropoff Location: ${journey.dropOff}', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size(double.infinity, 50),
//                           backgroundColor: Colors.black,
//                         ),
//                         child: const Text(
//                           'Close',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:avatii/models/driver_model.dart';
// import 'package:avatii/models/journeyModel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DriverDetailsScreen extends StatefulWidget {
//   final Journey? journey;
//   final Driver? driver;
//   final Map<String, double> currentLocation;

//   const DriverDetailsScreen({Key? key, required this.journey, required this.driver , required this.currentLocation}) : super(key: key);

//   @override
//   _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
// }

// class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
//   GoogleMapController? _mapController;


//   @override
//   Widget build(BuildContext context) {
//     Location? pickOffcoordinates=widget.journey?.pickOff;
//     double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
//     double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;
//     print(pickOffcoordinates?.latitude);
//     print(pickOffcoordinates?.longitude);
//     Location? dropOffcoordinates=widget.journey?.dropOff;
//     double dropoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
//     double dropoffLongitude = widget.currentLocation['longitude'] ?? 0.0;
//     print(dropOffcoordinates?.latitude);
//     print(dropOffcoordinates?.longitude);
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
//                 // target: LatLng(widget.journey.pickOffLatitude, widget.journey.pickOffLongitude),
//                 target: LatLng(28.7500, 77.1175),
//                 zoom: 14.0,
//               ),
//               markers: {
//                 Marker(
//                   markerId: MarkerId('pickup'),
//                   position: LatLng(pickOffcoordinates?.latitude ?? pickoffLatitude, pickOffcoordinates?.longitude ?? pickoffLongitude),
//                   infoWindow: InfoWindow(title: 'Pickup Location'),
//                 ),
//                 Marker(
//                   markerId: MarkerId('dropoff'),
//                   position: LatLng(dropOffcoordinates?.latitude ?? dropoffLatitude, dropOffcoordinates?.longitude ?? dropoffLongitude),
//                   infoWindow: InfoWindow(title: 'Dropoff Location'),
//                 ),
//               },
//             ),
//           ),
//           // Bottom Container for Driver Details
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.4, // 40% of the screen height
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF2F2F5),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Journey ID: ${widget.journey?.id}',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     Text('Driver: ${widget.driver?.name}'),
//                     Text('Phone: ${widget.driver?.phoneNumber}'),
//                     Text('Car: BMW'),
//                     Text('Pickup: ${widget.journey?.pickOff}'),
//                     Text('Dropoff: ${widget.journey?.dropOff}'),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         backgroundColor: Colors.black,
//                         elevation: 1,
//                       ),
//                       child: const Text(
//                         'Close',
//                         style: TextStyle(color: Colors.white),
//                       ),
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



import 'package:avatii/models/driver_model.dart';
import 'package:avatii/models/journeyModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverDetailsScreen extends StatefulWidget {
  final Journey? journey;
  final Driver? driver;
  final Map<String, double> currentLocation;

  const DriverDetailsScreen({
    Key? key,
    required this.journey,
    required this.driver,
    required this.currentLocation,
  }) : super(key: key);

  @override
  _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = Set<Polyline>();

  @override
  void initState() {
    super.initState();
    _createPolylines();
  }

  void _createPolylines() {
    Location? pickOffCoordinates = widget.journey?.pickOff;
    Location? dropOffCoordinates = widget.journey?.dropOff;

    // Fallback to current location if coordinates are not available
    LatLng pickOffLatLng = LatLng(
      pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
      pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
    );
    LatLng dropOffLatLng = LatLng(
      dropOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
      dropOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
    );

    _polylines.add(
      Polyline(
        polylineId: PolylineId('route'),
        points: [pickOffLatLng, dropOffLatLng],
        color: Colors.blue,
        width: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Location? pickOffCoordinates = widget.journey?.pickOff;
    double pickoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
    double pickoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

    Location? dropOffCoordinates = widget.journey?.dropOff;
    double dropoffLatitude = widget.currentLocation['latitude'] ?? 0.0;
    double dropoffLongitude = widget.currentLocation['longitude'] ?? 0.0;

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
                zoom: 14.0,
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
                  position: LatLng(
                    dropOffCoordinates?.latitude ?? dropoffLatitude,
                    dropOffCoordinates?.longitude ?? dropoffLongitude,
                  ),
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
                    Text('Pickup: ${widget.journey?.pickOff}'),
                    Text('Dropoff: ${widget.journey?.dropOff}'),
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
