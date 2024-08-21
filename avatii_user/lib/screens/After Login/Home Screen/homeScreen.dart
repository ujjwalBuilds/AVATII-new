import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:avatii/Navigation%20Bar/bottomNavigationBar.dart';
import 'package:avatii/constants/imageStrings.dart';

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

  final TextEditingController _destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _loading = false;
    });
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
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Your Location',
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
                                  print("placeDetails: ${prediction.lng}");
                                },
                                itemClick: (Prediction prediction) {
                                  _destinationController.text = prediction.description ?? '';
                                  _destinationController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description?.length ?? 0));
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
                              onPressed: () => _sheetaglaneeche(),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 50),
                                backgroundColor: Colors.black,
                                elevation: 1,
                              ),
                              child: const Text('Continue', style: TextStyle(color: Colors.white),)
                            ),
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

  void _sheetaglaneeche() {
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
                            _buildrides(rideType: 'Avatii X',price: '₹254.66',time: '8:15pm',distance: '4 min away',details: 'Private • Most popular',image: const AssetImage(Aimages.hatchback)),
                            _buildrides(rideType: 'Avatii XL',price: '₹290.57',time: '8:15pm',distance: '3 min away',details: 'Private • Popular',image: const AssetImage(Aimages.sedan)),
                            _buildrides(rideType: 'Avatii Lux',price: '₹350.13',time: '8:15pm',distance: '10 min away',details: 'Private • Very popular',image: const AssetImage(Aimages.hatchback)),
                            _buildrides(rideType: 'Avatii Auto',price: '₹180.45',time: '8:15pm',distance: '2 min away',details: 'Private • Popular',image: const AssetImage(Aimages.sedan)),
                            _buildrides(rideType: 'Avatii Moto',price: '₹120.37',time: '8:15pm',distance: '5 min away',details: 'Private • Very popular',image: const AssetImage(Aimages.hatchback)),
                            _buildrides(rideType: 'Avatii Share',price: '₹130.75',time: '8:15pm',distance: '20 min away',details: 'Shared • Less popular',image: const AssetImage(Aimages.sedan)),
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

Widget _buildrides({
  required String rideType,
  required String price,
  required String time,
  required String distance,
  required String details,
  required ImageProvider image,
}) {
  return Padding(
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
                              Text('Where would you go?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
                              SizedBox(width: 8),
                              Icon(Icons.location_on_rounded, color: Colors.grey,),
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
                            icon: const Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 37, 33, 33), size: 25,),
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