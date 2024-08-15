import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VehicleRegistrationScreen extends StatefulWidget {
  const VehicleRegistrationScreen({super.key});

  @override
  State<VehicleRegistrationScreen> createState() => _VehicleRegistrationScreenState();
}

class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {
  String? _selectedVehicle; // Track which vehicle is selected

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Define colors
    final Color defaultColor = Colors.white;
    final Color selectedColor = Colors.blue.shade100;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your\nvehicle details',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28),
            ),
            const SizedBox(height: 5),
            const Text(
              'Please enter the required details',
              style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(height: 25),
            const Text(
              'Which vehicle will you be driving?',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedVehicle = 'Car'; // Set the selected vehicle
                    });
                    // Handle tap
                    print('Car container tapped');
                    // GoRouter.of(context).push('/car-screen');
                  },
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: _selectedVehicle == 'Car' ? selectedColor : defaultColor,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 5), // Shadow only at the bottom
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/sedan_image.png', // Replace with your image asset
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Car',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedVehicle = 'Auto'; // Set the selected vehicle
                    });
                    // Handle tap
                    print('Auto container tapped');
                    // GoRouter.of(context).push('/auto-screen');
                  },
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: _selectedVehicle == 'Auto' ? selectedColor : defaultColor,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 5), // Shadow only at the bottom
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/auto-image.png', // Replace with your image asset
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Auto Rickshaw',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Vehicle Registration Number',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 108, 107, 107),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.directions_car_outlined, color: Colors.grey),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/upload-documents');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000000),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
