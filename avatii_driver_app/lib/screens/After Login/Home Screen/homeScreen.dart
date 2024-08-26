
// Add import for socket.io-client
import 'package:avatii_driver_app/helperFunction.dart';
import 'package:avatii_driver_app/provider/JourneyProvider.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
 import 'package:geolocator/geolocator.dart'as geo;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:avatii_driver_app/Url.dart';
import 'package:avatii_driver_app/provider/DriverProvider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';

import 'package:provider/provider.dart';

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
  String? driverId;
  Color accentPurpleColor = Color(0xFF6A53A1);

  Completer<GoogleMapController> _mapController = Completer();
  LocationData? _currentLocation;
  late Location _locationService;
  Marker? _marker;

  IO.Socket? socket; // Socket instance
  bool _hasRideRequest = false; // State to track if there's a ride request
  Map<String, dynamic>? _rideRequestDetails; // Store ride request details

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _locationService = Location();
    _initializeLocation();

    _locationService.onLocationChanged.listen((LocationData newLocation) {
      if (mounted) {
        setState(() {
          _currentLocation = newLocation;
          _updateMarker(newLocation);
        });
      }
    });
    load();
    
  }

  Future<void> _initializeLocation() async {
    final locationData = await _locationService.getLocation();
    setState(() {
      _currentLocation = locationData;
      _updateMarker(locationData);
    });

    final controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        14.0,
      ),
    );
  }
// Navigator.geolocation.watchPosition((position) => {
//   const location = {
//     lat: position.coords.latitude,
//     lng: position.coords.longitude
//   };
//   socket.emit("updateLocation", { driverId: driverId, location });
// });




  // Future<void> requestLocationPermissions() async {
  //   geo.LocationPermission permission = await geo.Geolocator.requestPermission();
  //   if (permission == geo.LocationPermission.denied ||
  //       permission == geo.LocationPermission.deniedForever) {
  //     // Handle permission denied
  //   }
  // }

  void _connectDriver() async {
    // String driverId = await Helperfunction.getDriverId(); // Replace with actual method to get driver ID
    print('Driver is connected just abhi hua hai.........***************************');
    socket?.emit('driverConnect', {
      'driverId': driverId
    });
  }

  void load() async {
    driverId = await Helperfunction.getUserId();
    _connectToSocket(); // Connect to the socket
  }

  Future<void> _updateMarker(LocationData newLocation) async {
    final heading = newLocation.heading ?? 0.0; // Get the heading (direction)

    final BitmapDescriptor rotatedMarker = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(120, 60)), // Adjust size as needed
      'assets/images/car-icon.png',
    );

    setState(() {
      _marker = Marker(
        markerId: MarkerId("current_location"),
        position: LatLng(newLocation.latitude!, newLocation.longitude!),
        icon: rotatedMarker,
        rotation: heading, // Rotate the marker according to the heading
        anchor: Offset(0.5, 0.5), // Center the marker image
      );
    });
  }


//..............................socket io initalization ...........................
  void _connectToSocket() {
    socket = IO.io(
        Appurls.baseurl,
        IO.OptionBuilder()
            .setTransports([
              'websocket'
            ])
            .enableAutoConnect()
            .build());

    socket?.on('connect', (_) {
      print('connected to socket server.......');
      _connectDriver();
    });

    socket?.on('rideRequest', (data) {
      print('Request is coming................................');
      setState(() {
        _hasRideRequest = true;
        _rideRequestDetails = data;
      });
      _showRideDetailsPopup(); // Show the popup when a ride request is received
    });

   socket?.on("startJourney",(data){
print("Started journey function ho rhi hai..........................");
var pickOffcorrdinates=data['pickOff'];
print(pickOffcorrdinates);
final corrdinatesofpassanger=LatLng(pickOffcorrdinates['latitude'], pickOffcorrdinates['longitude']);
print('this is  my pick up coordinatess......................');
    // Update the map to show the route from current location to pickup location
    
  setRouteToPickupLocation(corrdinatesofpassanger);
_showArrivalBottomSheet(data['journeyId']);
   });
   
    socket?.on('disconnect', (_) {
      print('disconnected from socket server');
    });
  }
///code for show arrival sheet bottom
  bool _showArrivalButton = true;
  TextEditingController _otpController = TextEditingController();
    void _showArrivalBottomSheet(String journeyId) {

    showModalBottomSheet(

    
      
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
          final  journeyProvider=Provider.of<JourneyProvider>(context,listen: false);
            return Container(
              padding: EdgeInsets.all(20.0),
              child: _showArrivalButton
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showArrivalButton = false;
                            });
                          },
                          child: Text('Arrived'),
                        ),
                      ],
                    )
                  :
                  journeyProvider.isvalidatingotp?CircularProgressIndicator():
                   Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       OtpTextField(
            numberOfFields: 6,
            borderColor: accentPurpleColor,
            focusedBorderColor: accentPurpleColor,
          //  styles: otpTextStyles,
            showFieldAsBox: false,
            borderWidth: 4.0,
            //runs when a code is typed in
           
            //runs when every textfield is filled 
            onSubmit: (String verificationCode) {
              journeyProvider.validateOTP(journeyId, verificationCode);
            }, 
    ),
                        
                        
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _validateOtp();
                          },
                          child: Text('Validate OTP'),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }

  void _validateOtp() {
    final otp = _otpController.text;
    if (otp.isNotEmpty) {
      print('Validating OTP: $otp');
      // Add your OTP validation logic here
      Navigator.of(context).pop(); // Close the bottom sheet after validation
    } else {
      print('Please enter a valid OTP');
    }
  }






Set<Polyline> _polylines = {};
Set<Marker> _markers = {};


Future<void> setRouteToPickupLocation(LatLng pickOffLocation) async {
  final GoogleMapController controller = await _mapController.future;
  final PolylinePoints polylinePoints = PolylinePoints();

  // Get the driver's current location
  LatLng driverCurrentLocation = LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);

  // Get route
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    
    googleApiKey: 'AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ'
    , // Replace with your actual API key
    // PointLatLng(driverCurrentLocation.latitude, driverCurrentLocation.longitude),
    // PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),
  
    // Add the request parameter
    request: PolylineRequest(
      origin:  PointLatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
      destination:  PointLatLng(pickOffLocation.latitude, pickOffLocation.longitude),
    mode: TravelMode.driving,
      //transitMode:  TreavelMode,
      avoidHighways: false,
      avoidTolls: false,
      avoidFerries: false,
    ),
  );

  if (result.points.isNotEmpty) {
    List<LatLng> polylineCoordinates = result.points
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();

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










  void _acceptRide() {
    // Notify the server that the ride was accepted
    socket?.emit('acceptRide', {
      // 'driverId': 'your_driver_id', // Replace with actual driver ID
      // 'userId': _rideRequestDetails?['userId'],
      // 'journeyId': 'your_journey_id', // Replace with actual journey ID
    'requestId':_rideRequestDetails?['requestId'],
    'driverId':driverId
    
    });
 print('ride is accepted .............................by the driver');
    // Close the popup and proceed with ride logic
    setState(() {
      _hasRideRequest = false;
      _rideRequestDetails = null;
    });

    Navigator.of(context).pop(); // Close the popup
  }

  void _rejectRide() {
    // Simply close the popup and clear ride request state
    setState(() {
      _hasRideRequest = false;
      _rideRequestDetails = null;
    });

    Navigator.of(context).pop(); // Close the popup
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _popupTimer?.cancel();
    socket?.disconnect();
    super.dispose();
  }

  /*Previous code for new ride popup to be shown in drivers app */

  // void _showRideDetailsPopup() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       _popupTimer = Timer(const Duration(seconds: 15), () {
  //         Navigator.of(context).pop(); // Close the popup after 15 seconds
  //       });

  //       return AlertDialog(
  //         title: Text('Ride Details'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text('From: ${_rideRequestDetails?['currentLocation']}'),
  //             Text('To: ${_rideRequestDetails?['destinationLocation']}'),
  //             Text('Estimated Earnings: ₹100'), // Example data
  //             const SizedBox(height: 20),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 // "Ignore" button
  //                 TextButton(
  //                   onPressed: _rejectRide,
  //                   child: Text('Ignore'),
  //                 ),
  //                 // "Accept" button with animated slider effect
  //                 SizedBox(
  //                   width: 120,
  //                   height: 40,
  //                   child: Stack(
  //                     children: [
  //                       AnimatedBuilder(
  //                         animation: _animationController!,
  //                         builder: (context, child) {
  //                           return Container(
  //                             width: 120,
  //                             height: 40,
  //                             decoration: BoxDecoration(
  //                               color: Colors.transparent,
  //                               borderRadius: BorderRadius.circular(8),
  //                               border: Border.all(color: Colors.green, width: 2),
  //                             ),
  //                             child: Align(
  //                               alignment: Alignment.centerLeft,
  //                               child: Container(
  //                                 width: 120 * _animationController!.value,
  //                                 height: 40,
  //                                 color: Colors.lightGreen.withOpacity(0.5),
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //                       Container(
  //                         width: 120,
  //                         height: 40,
  //                         decoration: BoxDecoration(
  //                           color: Colors.transparent,
  //                           borderRadius: BorderRadius.circular(8),
  //                           border: Border.all(color: Colors.green, width: 2),
  //                         ),
  //                         child: TextButton(
  //                           onPressed: _acceptRide,
  //                           child: Text('Accept', style: TextStyle(color: Colors.black)),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  /*New code for new ride popup to be shown in drivers app */

  void _showRideDetailsPopup() async {
    // Placeholder variables for human-readable addresses
    String fromAddress = 'Loading...';
    String toAddress = 'Loading...';

    if (_rideRequestDetails != null) {
      // Extract latitude and longitude from the map
      double? fromLat = _rideRequestDetails?['currentLocation']['latitude'];
      double? fromLng = _rideRequestDetails?['currentLocation']['longitude'];
      double? toLat = _rideRequestDetails?['destinationLocation']['latitude'];
      double? toLng = _rideRequestDetails?['destinationLocation']['longitude'];

      // Perform reverse geocoding to get human-readable addresses
      if (fromLat != null && fromLng != null) {
        List<Placemark> fromPlacemarks = await placemarkFromCoordinates(fromLat, fromLng);
        fromAddress = "${fromPlacemarks.first.street}, ${fromPlacemarks.first.locality}, ${fromPlacemarks.first.administrativeArea}, ${fromPlacemarks.first.country}";
      }

      if (toLat != null && toLng != null) {
        List<Placemark> toPlacemarks = await placemarkFromCoordinates(toLat, toLng);
        toAddress = "${toPlacemarks.first.street}, ${toPlacemarks.first.locality}, ${toPlacemarks.first.administrativeArea}, ${toPlacemarks.first.country}";
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        _popupTimer = Timer(const Duration(seconds: 15), () {
          Navigator.of(context).pop(); // Close the popup after 15 seconds
        });

        return AlertDialog(
          title: Text('Ride Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: $fromAddress'),
              Text('To: $toAddress'),
              Text('Estimated Earnings: ₹100'), // Example data
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "Ignore" button
                  TextButton(
                    onPressed: _rejectRide,
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
                            onPressed: _acceptRide,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          'Avatii',
          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
        ),
        actions: [
          Switch(
            value: _isOnline,
            onChanged: (value) async {
              setState(() {
                _isOnline = value;
              });

              if (_isOnline) {
                // Call the provider's method to change the driver's status
                await Provider.of<DriverProvider>(context, listen: false).changeDriverStatus();
                // _startAnimation();
              }
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
              polylines: _polylines,
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                zoom: 14.0,
              ),
              markers: _marker != null
                  ? {
                      _marker!
                    }
                  : {},
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _selectedLocation,
                          isExpanded: true,
                          items: _locations.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue!;
                            });
                          },
                        ),
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
}
