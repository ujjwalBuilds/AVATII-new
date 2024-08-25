import 'package:avatii/helperFunction.dart';
import 'package:avatii/models/ride_model.dart';
import 'package:avatii/provider/Ride_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:avatii/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:avatii/constants/imageStrings.dart';
import 'package:provider/provider.dart';
//import 'package:google_maps_webservice/places.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _locations = [
    'Your Current Location',
    'Set Location on Map',
  ];

  String _selectedLocation = 'Your Current Location';
  bool _isExpanded = false;
  GoogleMapController? _mapController;
  LatLng _initialPosition = const LatLng(0, 0);
  bool _loading = true;
  String _paymentMode = 'Cash';
   Map<String,double>?  destinationCoordinates;//destionation coordinates
  String? _selectedRide;
  Map<String,double>? currentCoordinates;//user current loaction corrdinates
  String? destinationAddress;//user destination location where he want to go
  String? currentAddress;///user location in words

  final TextEditingController _destinationController = TextEditingController();
  String? userid;
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _fetchCurrentLocation();
  _load();
  }

void _load()async{
  userid=await Helperfunction.getUserId();
}


  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied
        setState(() {
          _loading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission permanently denied
      setState(() {
        _loading = false;
      });
      return;
    }

    // Permission granted, get user location
    _getUserLocation();
  }

  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
        _loading = false;
      });
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _loading = false;
      });
    }
  }

  void _onLocationButtonPressed(String location) {
    print("Location selected: $location");
    // Add your location-specific functionality here
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

Future<void> _convertLatLngToAddress(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks!= Null) {
      Placemark place = placemarks[0];
      setState(() {
        currentAddress = "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } else {
      setState(() {
        currentAddress = "Address not found";
      });
    }
  } catch (e) {
    print("Error converting lat/lng to address: $e");
    setState(() {
      currentAddress = "Error fetching address";
    });
  }
}

  Future<void> _fetchCurrentLocation() async {
  try {
    print("Fetching location...");
    Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.best));
    print("Location fetched: ${position.latitude}, ${position.longitude}");
    // Store the current latitude and longitude
    setState(() {
      //currentCoordinates = "${position.latitude}, ${position.longitude}";
   currentCoordinates = {
  'latitude': position.latitude,
  'longitude': position.longitude,
};
   
    } );

    // Convert lat/long to a human-readable address
    await _convertLatLngToAddress(position.latitude, position.longitude);
  } catch (e) {
    print("Error fetching location: $e");
    setState(() {
      currentAddress = "Error fetching location";
    });
  }
}

  void _sheetneeche() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: Container(
          color: const Color(0xFFF2F2F5),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: 450,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 6),
                                child: Text(
                                  'Select Address',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Divider(
                              indent: 17,
                              endIndent: 17,
                              color: Colors.grey.shade300,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: TextField(
                                controller: TextEditingController(text: currentAddress ?? "Fetching address..."),
                                readOnly: true,
                                
                                decoration: InputDecoration(
                                  
                                  filled: true,
                                  fillColor: Colors.white,
                                //  hintText: currentAddress ?? '' ,
                                  
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 129, 129, 129),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  prefixIcon: const Icon(Icons.share_location_rounded, color: Colors.amber),
                                  suffixIcon: const Icon(Icons.my_location_rounded, color: Colors.grey, size: 15),
                                ),
                              ),
                            //  child: Text('$currentAddress'),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: GooglePlaceAutoCompleteTextField(
                                textEditingController: _destinationController,
                                googleAPIKey: "AIzaSyBqUXTvmc_JFLTShS3SRURTafDzd-pdgqQ",
                                inputDecoration: InputDecoration(
                                  hintText: 'Destination',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 129, 129, 129),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(color: Colors.blueAccent),
                                  ),
                                  prefixIcon: Icon(Icons.local_taxi_rounded, color: Colors.amber),
                                  suffixIcon: Icon(Icons.location_pin, color: Colors.grey, size: 15),
                                ),
                                debounceTime: 800,
                               isLatLngRequired: true,
                              getPlaceDetailWithLatLng: (Prediction prediction) {
                                setState(() {
                                //  destinationCoordinates = "${prediction.lat}, ${prediction.lng}";
destinationCoordinates = {
  'latitude': 40.7128,
  'longitude': -74.0060,
};
                                });
                                print("Destination Coordinates: .................................................$destinationCoordinates");
                              },
                              itemClick: (Prediction prediction) async {
                                _destinationController.text = prediction.description ?? '';
                                _destinationController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description?.length ?? 0));
                                setState(() {
                                  destinationAddress = prediction.description;
                                });
                              },
                                itemBuilder: (context, index, prediction) {
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        const SizedBox(width: 7),
                                        Expanded(child: Text(prediction.description ?? "")),
                                      ],
                                    ),
                                  );
                                },
                                seperatedBuilder: const Divider(),
                                isCrossBtnShown: true,
                                containerHorizontalPadding: 10,
                                placeType: PlaceType.geocode,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  _sheetaglaneeche();
                                  print("Current Location: $currentCoordinates");
                                  print("Destination Location: $destinationAddress");
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(350, 50),
                                  backgroundColor: Colors.black,
                                  elevation: 1,
                                ),
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(color: Colors.white),
                                )),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Saved Places',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 16),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildSavedPlace('Eleonora Hotel', '6 Glendale St. Worcester, MA 01604', '2.9 km'),
                            _buildSavedPlace('Grand City Park', '307 Lilac Drive Munster, IN 46321', '8.3 km'),
                            _buildSavedPlace('Mall Plaza', '8694 Essex St. Sunnyside, NY 11104', '4.4 km'),
                            _buildSavedPlace('Hellana Restaurant', '39 Oakland St. Clementon, NJ 08021', '2.5 km'),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  void _searchdriver() {
    //user current loaction coordinate
    //user destination coordinates
          print(userid);
          print("${currentCoordinates}...............................");
          print("${ destinationCoordinates}...........................");
          
     final rideRequest = RideRequest(
              userId: userid,
              currentLocation: currentCoordinates??{},
              destinationLocation: destinationCoordinates??{},
            );

            Provider.of<RideProvider>(context, listen: false).requestRide(rideRequest);
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF2F2F5),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: 500, // Increased height to accommodate new widgets
                child: const Center(
                  child: Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CircularProgressIndicator(color: Colors.black),
                          SizedBox(height: 10),
                          Text(
                            'Searching for Drivers...',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _sheetaglaneeche() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xFFF2F2F5),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    height: 500,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12, bottom: 6),
                                    child: Text(
                                      'Available rides',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Divider(
                                  indent: 17,
                                  endIndent: 17,
                                  color: Colors.grey.shade300,
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      _selectedRide = 'Avatii Cab';
                                    });
                                  },
                                  child: _buildrides(
                                    rideType: 'Avatii Cab',
                                    price: '₹254.66',
                                    time: '8:15pm',
                                    distance: '4 min away',
                                    details: 'Private • Most popular',
                                    image: const AssetImage(Aimages.hatchback),
                                    isSelected: _selectedRide == 'Avatii Cab',
                                  ),
                                ),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      _selectedRide = 'Avatii Auto';
                                    });
                                  },
                                  child: _buildrides(
                                    rideType: 'Avatii Auto',
                                    price: '₹290.57',
                                    time: '8:15pm',
                                    distance: '3 min away',
                                    details: 'Private • Popular',
                                    image: const AssetImage(Aimages.auto),
                                    isSelected: _selectedRide == 'Avatii Auto',
                                  ),
                                ),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      _selectedRide = 'Avatii Bike';
                                    });
                                  },
                                  child: _buildrides(
                                    rideType: 'Avatii Bike',
                                    price: '₹350.13',
                                    time: '8:15pm',
                                    distance: '10 min away',
                                    details: 'Private • Very popular',
                                    image: const AssetImage(Aimages.bike),
                                    isSelected: _selectedRide == 'Avatii Bike',
                                  ),
                                ),
                                const SizedBox(height: 16),
                                DropdownButton<String>(
                                  value: _paymentMode,
                                  onChanged: (String? newValue) {
                                    setModalState(() {
                                      _paymentMode = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Cash',
                                    'Online'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () => _searchdriver(),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      child: Text('Search for ride', style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildrides({
    required String rideType,
    required String price,
    required String time,
    required String distance,
    required String details,
    required ImageProvider image,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.blue : Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image(
            image: image,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rideType,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      distance,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  details,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedPlace(String name, String address, String distance) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(address, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(distance, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _loading
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.black,
                            child: IconButton(
                              icon: const Icon(Icons.my_location, color: Colors.white, size: 24),
                              onPressed: () {
                                _mapController?.animateCamera(
                                  CameraUpdate.newLatLng(_initialPosition),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildLocationButton('Home', () => print('Home button pressed')),
                          _buildLocationButton('Office', () => print('Office button pressed')),
                          _buildLocationButton('Apartment', () => print('Apartment button pressed')),
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  height: _isExpanded ? 300 : 190,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
                        child: ElevatedButton(
                          onPressed: () => _sheetneeche(),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            backgroundColor: Colors.white,
                            elevation: 0.2,
                            shadowColor: Colors.black,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Where would you go?',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
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
                const SizedBox(height: 50),
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
                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Color.fromARGB(255, 37, 33, 33),
                              size: 25,
                            ),
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
                        backgroundColor: Color.fromARGB(121, 255, 255, 255),
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

  Widget _buildLocationButton(String label, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.location_on, color: Colors.amber),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
