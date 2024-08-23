// import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationBar.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'dart:async';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   final List<String> _locations = [
//     'Your Current Location',
//     'Set Location on Map',
//   ];

//   String _selectedLocation = 'Your Current Location';
//   bool _isOnline = false; // Toggle state
//   Timer? _popupTimer;
//   AnimationController? _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     );
//   }

//   @override
//   void dispose() {
//     _animationController?.dispose();
//     _popupTimer?.cancel();
//     super.dispose();
//   }

//   void _startAnimation() {
//     _animationController?.reset();
//     _animationController?.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           'Avatii',
//           style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
//         ),
//         actions: [
//           Switch(
//             value: _isOnline,
//             onChanged: (value) {
//               setState(() {
//                 _isOnline = value;
//                 if (_isOnline) {
//                   _startAnimation();
//                   _showRideDetailsPopup();
//                 }
//               });
//             },
//             activeTrackColor: Colors.blue,
//             activeColor: Colors.white,
//           ),
//           Text(
//             _isOnline ? 'Online' : 'Offline',
//             style: TextStyle(color: Colors.white),
//           ),
//           const SizedBox(width: 16),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/map_placeholder.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           // Positioned widget for bottom navigation bar
//            Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: CustomNavigationBar(),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8, right: 4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(25),
//                             border: Border.all(color: Colors.grey),
//                           ),
//                           child: DropdownButton<String>(
//                             value: _selectedLocation,
//                             items: _locations.map((String location) {
//                               return DropdownMenuItem<String>(
//                                 value: location,
//                                 child: Text(
//                                   location,
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 _selectedLocation = newValue!;
//                               });
//                             },
//                             isExpanded: true,
//                             icon: const Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 37, 33, 33), size: 25),
//                             dropdownColor: Colors.white,
//                             underline: const SizedBox(),
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const CircleAvatar(
//                         radius: 25,
//                         backgroundColor: Color.fromARGB(149, 255, 255, 255),
//                         child: Icon(Iconsax.notification, color: Colors.black, size: 30),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showRideDetailsPopup() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         _popupTimer = Timer(const Duration(seconds: 15), () {
//           Navigator.of(context).pop(); // Close the popup after 15 seconds
//         });

//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Text('Ride Details'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('From: Your Location'),
//                   Text('To: Destination Location'),
//                   Text('Estimated Earnings: ₹100'),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // "Ignore" button
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(); // Close the popup
//                         },
//                         child: Text('Ignore'),
//                       ),
//                       // "Accept" button with animated slider effect
//                       SizedBox(
//                         width: 120,
//                         height: 40,
//                         child: Stack(
//                           children: [
//                             AnimatedBuilder(
//                               animation: _animationController!,
//                               builder: (context, child) {
//                                 return Container(
//                                   width: 120,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     color: Colors.transparent,
//                                     borderRadius: BorderRadius.circular(8),
//                                     border: Border.all(color: Colors.green, width: 2),
//                                   ),
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Container(
//                                       width: 120 * _animationController!.value,
//                                       height: 40,
//                                       color: Colors.lightGreen.withOpacity(0.5),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             Container(
//                               width: 120,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: Colors.green, width: 2),
//                               ),
//                               child: TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop(); // Close the popup
//                                 },
//                                 child: Text('Accept', style: TextStyle(color: Colors.black)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:location/location.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<String> _locations = [
    'Your Current Location',
    'Set Location on Map',
  ];

  String _selectedLocation = 'Your Current Location';
  bool _isOnline = false; // Toggle state
  Timer? _popupTimer;
  AnimationController? _animationController;

  Completer<GoogleMapController> _mapController = Completer();
  LocationData? _currentLocation;
  late Location _locationService;
  Marker? _marker;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _locationService = Location();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final locationData = await _locationService.getLocation();
    setState(() {
      _currentLocation = locationData;
      _marker = Marker(
        markerId: MarkerId("current_location"),
        position: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
      );
    });

    final controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        14.0,
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _popupTimer?.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _animationController?.reset();
    _animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Avatii',
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
        ),
        actions: [
          Switch(
            value: _isOnline,
            onChanged: (value) {
              setState(() {
                _isOnline = value;
                if (_isOnline) {
                  _startAnimation();
                  _showRideDetailsPopup();
                }
              });
            },
            activeTrackColor: Colors.blue,
            activeColor: Colors.white,
          ),
          Text(
            _isOnline ? 'Online' : 'Offline',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          if (_currentLocation != null)
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                zoom: 14.0,
              ),
              markers: _marker != null ? {_marker!} : {},
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
            )
          else
            Center(child: CircularProgressIndicator()),

          // Positioned widget for bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedLocation,
                            items: _locations.map((String location) {
                              return DropdownMenuItem<String>(
                                value: location,
                                child: Text(
                                  location,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLocation = newValue!;
                              });
                            },
                            isExpanded: true,
                            icon: const Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 37, 33, 33), size: 25),
                            dropdownColor: Colors.white,
                            underline: const SizedBox(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(149, 255, 255, 255),
                        child: Icon(Iconsax.notification, color: Colors.black, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showRideDetailsPopup() {
    showDialog(
      context: context,
      builder: (context) {
        _popupTimer = Timer(const Duration(seconds: 15), () {
          Navigator.of(context).pop(); // Close the popup after 15 seconds
        });

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Ride Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('From: Your Location'),
                  Text('To: Destination Location'),
                  Text('Estimated Earnings: ₹100'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // "Ignore" button
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the popup
                        },
                        child: Text('Ignore'),
                      ),
                      // "Accept" button with animated slider effect
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: Stack(
                          children: [
                            AnimatedBuilder(
                              animation: _animationController!,
                              builder: (context, child) {
                                return Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.green, width: 2),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 120 * _animationController!.value,
                                      height: 40,
                                      color: Colors.lightGreen.withOpacity(0.5),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.green, width: 2),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the popup
                                },
                                child: Text('Accept', style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
