// import 'package:avatii_driver_app/model/driver_model.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/uploadDocuments.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';


// class VehicleRegistrationScreen extends StatefulWidget {
//    Driver driver;
//    VehicleRegistrationScreen({super.key,
//    required this.driver
//    });

//   @override
//   State<VehicleRegistrationScreen> createState() => _VehicleRegistrationScreenState();
// }

// class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {
//   String? _selectedVehicle; // Track which vehicle is selected
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _vehicleRegController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;

//     // Define colors
//     final Color defaultColor = Colors.white;
//     final Color selectedColor = Colors.blue.shade100;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50), // Add some top padding
//                 const Text(
//                   'Please enter your\nvehicle details',
//                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28),
//                 ),
//                 const SizedBox(height: 5),
//                 const Text(
//                   'Please enter the required details',
//                   style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14),
//                 ),
//                 const SizedBox(height: 25),
//                 const Text(
//                   'Which vehicle will you be driving?',
//                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedVehicle = 'Car'; // Set the selected vehicle
//                         });
//                         print('Car container tapped');
//                       },
//                       child: Container(
//                         width: 140,
//                         height: 140,
//                         decoration: BoxDecoration(
//                           color: _selectedVehicle == 'Car' ? selectedColor : defaultColor,
//                           borderRadius: BorderRadius.circular(13),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               offset: Offset(0, 5), // Shadow only at the bottom
//                               blurRadius: 10.0,
//                               spreadRadius: 0.0,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               'assets/images/sedan_image.png', // Replace with your image asset
//                               width: 100,
//                               height: 100,
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               'Car',
//                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedVehicle = 'Auto'; // Set the selected vehicle
//                         });
//                         print('Auto container tapped');
//                       },
//                       child: Container(
//                         width: 140,
//                         height: 140,
//                         decoration: BoxDecoration(
//                           color: _selectedVehicle == 'Auto' ? selectedColor : defaultColor,
//                           borderRadius: BorderRadius.circular(13),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               offset: Offset(0, 5), // Shadow only at the bottom
//                               blurRadius: 10.0,
//                               spreadRadius: 0.0,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               'assets/images/auto-image.png', // Replace with your image asset
//                               width: 100,
//                               height: 100,
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               'Auto Rickshaw',
//                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedVehicle = 'Bike'; // Set the selected vehicle
//                         });
//                         print('Bike container tapped');
//                       },
//                       child: Container(
//                         width: 140,
//                         height: 140,
//                         decoration: BoxDecoration(
//                           color: _selectedVehicle == 'Bike' ? selectedColor : defaultColor,
//                           borderRadius: BorderRadius.circular(13),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               offset: Offset(0, 5), // Shadow only at the bottom
//                               blurRadius: 10.0,
//                               spreadRadius: 0.0,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               'assets/images/bike-image.png', // Replace with your image asset
//                               width: 100,
//                               height: 100,
//                             ),
//                             const SizedBox(height: 5),
//                             const Text(
//                               'Bike',
//                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 TextFormField(
//                   controller: _vehicleRegController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Vehicle Registration Number',
//                     hintStyle: const TextStyle(
//                       color: Color.fromARGB(255, 108, 107, 107),
//                       fontWeight: FontWeight.normal,
//                       fontSize: 14,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(7),
//                       borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.blueAccent),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     suffixIcon: const Icon(Icons.directions_car_outlined, color: Colors.grey),
//                   ),
//                   keyboardType: TextInputType.name,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your vehicle registration number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 50),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 100,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate() && _selectedVehicle != null) {
//                            var vehicle=Vehicle(type: _selectedVehicle,
//                             rcImage: '',
//                              registrationNumber: _vehicleRegController.text
//                              );
//                              widget.driver.vehicle=vehicle;
                            

                          
//                           //  GoRouter.of(context).push('/upload-documents');
//                           Get.to(()=>UploadDocumentsScreen(driver: widget.driver,));
                          
//                           } else {
//                             if (_selectedVehicle == null) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Please select a vehicle')),
//                               );
//                             }
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF000000),
//                           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           'Continue',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:avatii_driver_app/model/driver_model.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/uploadDocuments.dart';

class VehicleRegistrationScreen extends StatefulWidget {
  final Driver driver;
  
  const VehicleRegistrationScreen({Key? key, required this.driver}) : super(key: key);

  @override
  State<VehicleRegistrationScreen> createState() => _VehicleRegistrationScreenState();
}

class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {
  String? _selectedVehicle;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _vehicleRegController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildVehicleOption('Car', 'assets/images/sedan_image.png'),
                        const SizedBox(width: 10),
                        _buildVehicleOption('Auto', 'assets/images/auto-image.png', label: 'Auto Rickshaw'),
                        const SizedBox(width: 10),
                        _buildVehicleOption('Bike', 'assets/images/bike-image.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _vehicleRegController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your vehicle registration number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000000),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
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
  }

  Widget _buildVehicleOption(String type, String imagePath, {String? label}) {
    final bool isSelected = _selectedVehicle == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedVehicle = type),
      child: Container(
        width: 140,
        height: 160,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 5),
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 5),
            Text(
              label ?? type,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedVehicle != null) {
      final vehicle = Vehicle(
        type: _selectedVehicle,
        rcImage: '',
        registrationNumber: _vehicleRegController.text,
      );
      widget.driver.vehicle = vehicle;
      Get.to(() => UploadDocumentsScreen(driver: widget.driver));
    } else {
      if (_selectedVehicle == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a vehicle')),
        );
      }
    }
  }
}