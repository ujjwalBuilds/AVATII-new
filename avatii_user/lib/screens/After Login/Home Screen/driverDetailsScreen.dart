import 'dart:math';

import 'package:avatii/constants/imageStrings.dart';
import 'package:avatii/helperFunction.dart';
import 'package:avatii/models/driver_model.dart';
import 'package:avatii/models/journeyModel.dart' as journey;
import 'package:avatii/models/journeyModel.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii/url.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:url_launcher/url_launcher.dart';

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
  Marker? _driverMarker;
  IO.Socket? socket;
  String? userid;
  @override
  void initState() {
    super.initState();
    _createPolylines();
    _getAddresses();
    _initializeSocket();
    _createPolylines();

    print('..............................init function over..............................................');
  }

  void _load() async {
    userid = await HelperFunction.getUserId();
  }

  void _initializeSocket() {
    socket = IO.io(
        Appurls.baseurl,
        IO.OptionBuilder()
            .setTransports([
              'websocket'
            ])
            .enableAutoConnect()
            .build());

    socket?.on('connect', (_) {
      print('connected to socket server.....................................');
    });

    socket?.on("locationUpdate", (data) {
      // Update the driver's marker on the user's map
      print("Driver ki updated location aa rhi hai mere pass.................................");
      var loc = data['location'];
      print("${loc}...............Driver ke coordinates");
      var location = LatLng(loc['lat'], loc['lng']);
      updateDriverMarkerOnMap(data['location']);
    });

    socket?.on("journeyEnded", (data) {
      print('Driver has ended the journey........................................');
      showJourneyEndedNotification(context);

      ///pop lagana yyha pe jispe likeha hoag journey has ended ...............................
    });

    socket?.on("journeyCancelled", (data) {
      print("journey has been cancel .....................................................");
      showCancelNotification(context);

//yaha pe ek pop up aga .................cancel journey ka......................
      showCancelNotification(context);
    });

    socket?.on('disconnect', (_) {
      print('disconnected from socket server');
    });
  }

  void showJourneyEndedNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ride Completed 🎉'),
          content: Text('Journey has ended pls pay the driver!!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void showCancelNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ride Cancellation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          content: Text('Ride cancelled succesfully'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Navigator.of(context).pop(); // Dismiss the dialog
                // Navigator.of(context).pop(); // Dismiss the dialog
                // Navigator.of(context).pop(); // Dismiss the dialog
                // Navigator.of(context).pop(); // Dismiss the dialog
                // Navigator.of(context).pop(); // Dismiss the dialog
                // Navigator.of(context).pop(); // Dismiss the dialog
                Get.offAll(() => HomeScreen());
              },
            ),
          ],
        );
      },
    );
  }

  // Function to update or add the driver marker on the map
  void updateDriverMarkerOnMap(LatLng driverLocation) {
    setState(() {
      if (_driverMarker == null) {
        // Add new marker if it doesn't exist
        _driverMarker = Marker(
          markerId: MarkerId("driver"),
          position: driverLocation,
          infoWindow: InfoWindow(title: "Driver Location"),
        );
      } else {
        // Update the existing marker's position
        _driverMarker = _driverMarker!.copyWith(
          positionParam: driverLocation,
        );
      }

      // Optionally, center the map on the driver's location
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(driverLocation),
      );
    });
  }

  Future<void> requestLocationPermissions() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      // Handle permission denied
    }
  }
Future<void> _createPolylines() async {
  journey.Location? pickOffCoordinates = widget.journey?.pickOff;

  // Set the pickup and drop-off coordinates, falling back to current location if necessary
  LatLng pickOffLatLng = LatLng(
    pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
    pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
  );

  LatLng dropOffLatLng = widget.destinationCoordinates ??
      LatLng(
        widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
        widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
      );

  // Debugging: Print coordinates to ensure they're correct
  print("Pickup Coordinates: $pickOffLatLng");
  print("Dropoff Coordinates: $dropOffLatLng");

  // Ensure that the coordinates are valid
  if (pickOffLatLng.latitude == 0.0 && pickOffLatLng.longitude == 0.0) {
    print("Invalid pickup coordinates, cannot create polyline.");
    return;
  }

  if (dropOffLatLng.latitude == 0.0 && dropOffLatLng.longitude == 0.0) {
    print("Invalid drop-off coordinates, cannot create polyline.");
    return;
  }

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
    for (var point in result.points) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }
    print("Polyline Points: $polylineCoordinates");
  } else {
    print("No polyline points found!");
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

  // Calculate bounds for camera update
  LatLngBounds bounds = LatLngBounds(
    southwest: LatLng(
      min(pickOffLatLng.latitude, dropOffLatLng.latitude),
      min(pickOffLatLng.longitude, dropOffLatLng.longitude),
    ),
    northeast: LatLng(
      max(pickOffLatLng.latitude, dropOffLatLng.latitude),
      max(pickOffLatLng.longitude, dropOffLatLng.longitude),
    ),
  );

  // Update the camera to fit the polyline within the view
  _mapController?.animateCamera(
    CameraUpdate.newLatLngBounds(bounds, 100.0),
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
        pickupAddress = '${pickupPlacemarks[0].name}, ${pickupPlacemarks[0].thoroughfare}, ${pickupPlacemarks[0].administrativeArea}, ${pickupPlacemarks[0].locality}, ${pickupPlacemarks[0].postalCode}';
        dropoffAddress = '${dropoffPlacemarks[0].name}, ${dropoffPlacemarks[0].thoroughfare}, ${dropoffPlacemarks[0].administrativeArea}, ${dropoffPlacemarks[0].locality}, ${dropoffPlacemarks[0].postalCode}';
        // "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}"
      });
    } catch (e) {
      print('Error getting addresses: $e');
    }
  }

  void cancelRide(journeyId, userId) {
    socket?.emit("cancelJourney", {
      "journeyId" : journeyId,
      "userId" : userId,
    });
    print("mane cancel krdi apni traf se.............");
    // navigator?.pop(context);
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
              //     markers: {
              //       Marker(
              //         markerId: MarkerId('pickup'),
              //         position: LatLng(
              //           pickOffCoordinates?.latitude ?? pickoffLatitude,
              //           pickOffCoordinates?.longitude ?? pickoffLongitude,
              //         ),
              //         infoWindow: InfoWindow(title: 'Pickup Location'),
              //       ),
              //       Marker(
              //         markerId: MarkerId('dropoff'),
              //         position: dropOffLatLng,
              //         infoWindow: InfoWindow(title: 'Dropoff Location'),
              //       ),
              //       _driverMarker!=null?_driverMarker!:Marker(markerId: MarkerId('driver'))
              //  },
              markers: {
                Marker(
                  markerId: MarkerId('pickup'),
                  position: LatLng(
                    pickOffCoordinates?.latitude ?? pickoffLatitude,
                    pickOffCoordinates?.longitude ?? pickoffLongitude,
                  ),
                  infoWindow: InfoWindow(title: 'Pickup Location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan), // cyan marker
                ),
                Marker(
                  markerId: MarkerId('dropoff'),
                  position: dropOffLatLng,
                  infoWindow: InfoWindow(title: 'Dropoff Location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // Red marker
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Ride Assigned',
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
                                      TextSpan(text: 'Driver Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: widget.driver?.name),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 3),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                    children: [
                                      TextSpan(text: 'Ride Fare: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: "₹${widget.journey?.distance}"),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 3),
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
                        onPressed: () async {
                          final phoneNumber = widget.driver?.phoneNumber;
                          if (phoneNumber != null) {
                            final Uri url = Uri(scheme: 'tel', path: phoneNumber);
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              // Handle the error if the phone app cannot be launched
                              print('Could not launch $url');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                        ),
                        child: Text('CALL DRIVER', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          cancelRide(widget.journey?.id, userid);
                        },
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
          ),
        ],
      ),
    );
  }
}
