// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';

// // class UserInfoScreen extends StatefulWidget {
// //   const UserInfoScreen({super.key});

// //   @override
// //   State<UserInfoScreen> createState() => _UserInfoScreenState();
// // }

// // class _UserInfoScreenState extends State<UserInfoScreen> {
// //   String? _selectedState;

// //   // List of Indian states and union territories
// //   final List<String> _statesAndUTs = [
// //     'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
// //     'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
// //     'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
// //     'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
// //     'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
// //     'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
// //     'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
// //     'Delhi', 'Puducherry'
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
// //             const SizedBox(height: 5),
// //             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
// //             const SizedBox(height: 20),
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.person,color: Colors.grey,),
// //               ),
// //               keyboardType: TextInputType.name,
// //             ),
// //             const SizedBox(height: 15),
// //             DropdownButtonFormField<String>(
// //               value: _selectedState,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //               ),
// //               isExpanded: true, // Ensures dropdown fits the available width
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.person,color: Colors.grey,),
// //               ),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 50),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: 100,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       GoRouter.of(context).push('/vehicle-registration');
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Color(0xFF000000),
// //                       padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: Text('Next', style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.white,
// //                     )),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class UserInfoScreen extends StatefulWidget {
// //   const UserInfoScreen({super.key});

// //   @override
// //   State<UserInfoScreen> createState() => _UserInfoScreenState();
// // }

// // class _UserInfoScreenState extends State<UserInfoScreen> {
// //   String? _selectedState;
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _phoneNumberController = TextEditingController();

// //   // List of Indian states and union territories
// //   final List<String> _statesAndUTs = [
// //     'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
// //     'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
// //     'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
// //     'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
// //     'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
// //     'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
// //     'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
// //     'Delhi', 'Puducherry'
// //   ];

// //   // Method to register the driver
// //   Future<void> registerDriver(String vehicleType, String vehicleRegistrationNumber) async {
// //     final response = await http.post(
// //       Uri.parse('https://avatii-new.onrender.com/api/user/register'), // Replace with your actual API URL
// //       headers: <String, String>{
// //         'Content-Type': 'application/json; charset=UTF-8',
// //       },
// //       body: jsonEncode(<String, dynamic>{
// //         'name': _nameController.text,
// //         'city': _selectedState,
// //         'age': 30, // Replace with actual age if needed
// //         'PhoneNumber': _phoneNumberController.text,
// //         'vehicle': {
// //           'Type': vehicleType,
// //           'RegistrationNumber': vehicleRegistrationNumber,
// //         },
// //         'drivingLicense': {
// //           'LicenseNumber': 'DL1234567890', // Replace with actual license number
// //           'Image': 'license_image_url', // Replace with actual license image URL
// //         },
// //         'profileUrl': 'profile_image_url', // Replace with actual profile URL
// //       }),
// //     );

// //     if (response.statusCode == 201) {
// //       // Successfully registered
// //       print('Driver registered successfully');
// //     } else {
// //       // Error occurred
// //       print('Failed to register driver: ${response.body}');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
// //             const SizedBox(height: 5),
// //             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.person,color: Colors.grey,),
// //               ),
// //               keyboardType: TextInputType.name,
// //             ),
// //             const SizedBox(height: 15),
// //             // Dropdown for selecting state
// //             DropdownButtonFormField<String>(
// //               value: _selectedState,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //               ),
// //               isExpanded: true,
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               controller: _phoneNumberController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.person,color: Colors.grey,),
// //               ),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 50),
// //             // Next button to navigate to vehicle registration screen
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: 100,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => VehicleRegistrationScreen(
// //                             onComplete: registerDriver, // Pass the registerDriver function
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Color(0xFF000000),
// //                       padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: Text('Next', style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.white,
// //                     ),),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';

// // class UserInfoScreen extends StatefulWidget {
// //   const UserInfoScreen({super.key});

// //   @override
// //   State<UserInfoScreen> createState() => _UserInfoScreenState();
// // }

// // class _UserInfoScreenState extends State<UserInfoScreen> {
// //   String? _selectedState;
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _phoneNumberController = TextEditingController();

// //   final List<String> _statesAndUTs = [
// //     'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
// //     'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
// //     'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
// //     'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
// //     'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
// //     'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
// //     'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
// //     'Delhi', 'Puducherry'
// //   ];

// //   Future<void> saveUserInfo() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('name', _nameController.text);
// //     await prefs.setString('city', _selectedState!);
// //     await prefs.setString('phoneNumber', _phoneNumberController.text);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text(
// //               'Please enter your details',
// //               style: TextStyle(
// //                 color: Colors.black,
// //                 fontWeight: FontWeight.w600,
// //                 fontSize: 28,
// //               ),
// //             ),
// //             const SizedBox(height: 5),
// //             const Text(
// //               'Registration process is very simple',
// //               style: TextStyle(
// //                 color: Color.fromARGB(255, 21, 14, 168),
// //                 fontWeight: FontWeight.w400,
// //                 fontSize: 14,
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.person, color: Colors.grey),
// //               ),
// //               keyboardType: TextInputType.name,
// //             ),
// //             const SizedBox(height: 15),
// //             DropdownButtonFormField<String>(
// //               value: _selectedState,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 contentPadding: EdgeInsets.symmetric(
// //                     horizontal: 16.0, vertical: 14.0),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //               ),
// //               isExpanded: true,
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               controller: _phoneNumberController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.phone, color: Colors.grey),
// //               ),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 50),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: 100,
// //                   child: ElevatedButton(
// //                     onPressed: () async {
// //                       await saveUserInfo();
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => VehicleRegistrationScreen(
// //                             onComplete: () async {
// //                               final prefs =
// //                                   await SharedPreferences.getInstance();
// //                               final name = prefs.getString('name') ?? '';
// //                               final city = prefs.getString('city') ?? '';
// //                               final phoneNumber =
// //                                   prefs.getString('phoneNumber') ?? '';
// //                               print('Name: $name');
// //                               print('City: $city');
// //                               print('Phone Number: $phoneNumber');
// //                             },
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF000000),
// //                       padding: const EdgeInsets.symmetric(
// //                           vertical: 15, horizontal: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       'Next',
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class UserInfoScreen extends StatefulWidget {
// //   const UserInfoScreen({super.key});

// //   @override
// //   State<UserInfoScreen> createState() => _UserInfoScreenState();
// // }

// // class _UserInfoScreenState extends State<UserInfoScreen> {
// //   String? _selectedState;
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _phoneNumberController = TextEditingController();

// //   final List<String> _statesAndUTs = [
// //     'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
// //     'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
// //     'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
// //     'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
// //     'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
// //     'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
// //     'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
// //     'Delhi', 'Puducherry'
// //   ];

// //   Future<void> postUserInfo() async {
// //     final url = 'https://avatii-new.onrender.com/api/user/register'; // Replace with your backend URL
// //     final response = await http.post(
// //       Uri.parse(url),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'name': _nameController.text,
// //         'city': _selectedState,
// //         'PhoneNumber': _phoneNumberController.text, // Updated field name
// //         // Add other fields if necessary
// //       }),
// //     );

// //     if (response.statusCode == 201) {
// //       print('User info posted successfully');
// //     } else {
// //       print('Failed to post user info: ${response.reasonPhrase}');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text(
// //               'Please enter your details',
// //               style: TextStyle(
// //                 color: Colors.black,
// //                 fontWeight: FontWeight.w600,
// //                 fontSize: 28,
// //               ),
// //             ),
// //             const SizedBox(height: 5),
// //             const Text(
// //               'Registration process is very simple',
// //               style: TextStyle(
// //                 color: Color.fromARGB(255, 21, 14, 168),
// //                 fontWeight: FontWeight.w400,
// //                 fontSize: 14,
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.person, color: Colors.grey),
// //               ),
// //               keyboardType: TextInputType.name,
// //             ),
// //             const SizedBox(height: 15),
// //             DropdownButtonFormField<String>(
// //               value: _selectedState,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 contentPadding: EdgeInsets.symmetric(
// //                     horizontal: 16.0, vertical: 14.0),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //               ),
// //               isExpanded: true,
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               controller: _phoneNumberController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 hintStyle: const TextStyle(
// //                   color: Color.fromARGB(255, 108, 107, 107),
// //                   fontWeight: FontWeight.normal,
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(Icons.phone, color: Colors.grey),
// //               ),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 50),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: 100,
// //                   child: ElevatedButton(
// //                     onPressed: () async {
// //                       await postUserInfo();
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => VehicleRegistrationScreen(
// //                             onComplete: (vehicle, registrationNumber) async {
// //                               print('Vehicle: $vehicle');
// //                               print('Registration Number: $registrationNumber');
// //                               // Handle additional logic if needed
// //                             },
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF000000),
// //                       padding: const EdgeInsets.symmetric(
// //                           vertical: 15, horizontal: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       'Next',
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:avatii_driver_app/user_model.dart';
// // import 'package:avatii_driver_app/user_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:go_router/go_router.dart';

// // class UserInfoScreen extends StatefulWidget {
// //   const UserInfoScreen({super.key});

// //   @override
// //   State<UserInfoScreen> createState() => _UserInfoScreenState();
// // }

// // class _UserInfoScreenState extends State<UserInfoScreen> {
// //   String? _selectedState;
// //   final _nameController = TextEditingController();
// //   final _mobileNumberController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     // final userProvider = Provider.of<UserProvider>(context);
// //     final userProvider = Provider.of<UserProvider>(context);

// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
// //             const SizedBox(height: 5),
// //             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 hintStyle: const TextStyle(color: Color.fromARGB(255, 108, 107, 107), fontWeight: FontWeight.normal),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(
// //                   Icons.person,
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //               keyboardType: TextInputType.name,
// //             ),
// //             const SizedBox(height: 15),
// //             DropdownButtonFormField<String>(
// //               value: _selectedState,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //                 hintStyle: const TextStyle(color: Color.fromARGB(255, 108, 107, 107), fontWeight: FontWeight.normal),
// //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //               ),
// //               isExpanded: true,
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               controller: _mobileNumberController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 hintStyle: const TextStyle(color: Color.fromARGB(255, 108, 107, 107), fontWeight: FontWeight.normal),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(
// //                   Icons.phone,
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 50),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: 100,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       userProvider.updateUser(User(
// //                         name: _nameController.text,
// //                         city: _selectedState ?? '',
// //                         mobileNumber: _mobileNumberController.text,
// //                         vehicleType: userProvider.user.vehicleType,
// //                         vehicleNumber: userProvider.user.vehicleNumber,
// //                         drivingLicense: userProvider.user.drivingLicense,
// //                         drivingLicenseNumber: userProvider.user.drivingLicenseNumber,
// //                         phoneNumber: userProvider.user.phoneNumber,
// //                       ));
// //                       GoRouter.of(context).push('/vehicle-registration');
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Color(0xFF000000),
// //                       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: Text('Next', style: TextStyle(fontSize: 14, color: Colors.white)),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // final List<String> _statesAndUTs = [
// //   'Andhra Pradesh',
// //   'Arunachal Pradesh',
// //   'Assam',
// //   'Bihar',
// //   'Chhattisgarh',
// //   'Goa',
// //   'Gujarat',
// //   'Haryana',
// //   'Himachal Pradesh',
// //   'Jharkhand',
// //   'Karnataka',
// //   'Kerala',
// //   'Madhya Pradesh',
// //   'Maharashtra',
// //   'Manipur',
// //   'Meghalaya',
// //   'Mizoram',
// //   'Nagaland',
// //   'Odisha',
// //   'Punjab',
// //   'Rajasthan',
// //   'Sikkim',
// //   'Tamil Nadu',
// //   'Telangana',
// //   'Tripura',
// //   'Uttar Pradesh',
// //   'Uttarakhand',
// //   'West Bengal',
// //   'Andaman and Nicobar Islands',
// //   'Chandigarh',
// //   'Dadra and Nagar Haveli and Daman and Diu',
// //   'Lakshadweep',
// //   'Delhi',
// //   'Puducherry'
// // ];


// // import 'package:avatii_driver_app/user_model.dart';
// // import 'package:avatii_driver_app/user_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart'; // Import the provider package
// // import 'package:go_router/go_router.dart';

// // class UserInfoScreen extends StatefulWidget {
// //   const UserInfoScreen({super.key});

// //   @override
// //   State<UserInfoScreen> createState() => _UserInfoScreenState();
// // }

// // class _UserInfoScreenState extends State<UserInfoScreen> {
// //   String? _selectedState;
// //   final _nameController = TextEditingController();
// //   final _mobileNumberController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     final Size screenSize = MediaQuery.of(context).size;
// //     final userProvider = Provider.of<UserProvider>(context);

// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
// //             const SizedBox(height: 5),
// //             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: _nameController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 hintStyle: const TextStyle(color: Color.fromARGB(255, 108, 107, 107), fontWeight: FontWeight.normal),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(
// //                   Icons.person,
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //               keyboardType: TextInputType.name,
// //             ),
// //             const SizedBox(height: 15),
// //             DropdownButtonFormField<String>(
// //               value: _selectedState,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //                 hintStyle: const TextStyle(color: Color.fromARGB(255, 108, 107, 107), fontWeight: FontWeight.normal),
// //                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //               ),
// //               isExpanded: true,
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               controller: _mobileNumberController,
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 hintStyle: const TextStyle(color: Color.fromARGB(255, 108, 107, 107), fontWeight: FontWeight.normal),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: const BorderSide(color: Colors.blueAccent),
// //                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
// //                 ),
// //                 suffixIcon: const Icon(
// //                   Icons.phone,
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             const SizedBox(height: 50),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: 100,
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       userProvider.updateUser(User(
// //                         name: _nameController.text,
// //                         city: _selectedState ?? '',
// //                         mobileNumber: _mobileNumberController.text,
// //                         vehicleType: userProvider.user.vehicleType,
// //                         vehicleNumber: userProvider.user.vehicleNumber,
// //                         drivingLicense: userProvider.user.drivingLicense,
// //                         drivingLicenseNumber: userProvider.user.drivingLicenseNumber,
// //                         phoneNumber: userProvider.user.phoneNumber,
// //                       ));
// //                       GoRouter.of(context).push('/vehicle-registration');
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Color(0xFF000000),
// //                       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                     ),
// //                     child: Text('Next', style: TextStyle(fontSize: 14, color: Colors.white)),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // final List<String> _statesAndUTs = [
// //   'Andhra Pradesh',
// //   'Arunachal Pradesh',
// //   'Assam',
// //   'Bihar',
// //   'Chhattisgarh',
// //   'Goa',
// //   'Gujarat',
// //   'Haryana',
// //   'Himachal Pradesh',
// //   'Jharkhand',
// //   'Karnataka',
// //   'Kerala',
// //   'Madhya Pradesh',
// //   'Maharashtra',
// //   'Manipur',
// //   'Meghalaya',
// //   'Mizoram',
// //   'Nagaland',
// //   'Odisha',
// //   'Punjab',
// //   'Rajasthan',
// //   'Sikkim',
// //   'Tamil Nadu',
// //   'Telangana',
// //   'Tripura',
// //   'Uttar Pradesh',
// //   'Uttarakhand',
// //   'West Bengal',
// //   'Andaman and Nicobar Islands',
// //   'Chandigarh',
// //   'Dadra and Nagar Haveli and Daman and Diu',
// //   'Lakshadweep',
// //   'Delhi',
// //   'Puducherry'
// // ];



// // lib/screens/user_info_screen.dart
// // import 'package:avatii_driver_app/user_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:go_router/go_router.dart';
// // class UserInfoScreen extends ConsumerWidget {
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final user = ref.watch(userProvider);
// //     final userNotifier = ref.read(userProvider.notifier);

// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
// //             const SizedBox(height: 5),
// //             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
// //             const SizedBox(height: 20),
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your name',
// //                 suffixIcon: const Icon(Icons.person,color: Colors.grey,),
// //               ),
// //               onChanged: (value) => userNotifier.state = user.copyWith(name: value),
// //             ),
// //             const SizedBox(height: 15),
// //             DropdownButtonFormField<String>(
// //               value: user.city,
// //               items: _statesAndUTs.map((state) {
// //                 return DropdownMenuItem<String>(
// //                   value: state,
// //                   child: Text(state),
// //                 );
// //               }).toList(),
// //               onChanged: (value) => userNotifier.state = user.copyWith(city: value),
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Choose your city',
// //               ),
// //               isExpanded: true,
// //             ),
// //             const SizedBox(height: 15),
// //             TextField(
// //               decoration: InputDecoration(
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 hintText: 'Enter your mobile number',
// //                 suffixIcon: const Icon(Icons.phone, color: Colors.grey),
// //               ),
// //               keyboardType: TextInputType.phone,
// //               onChanged: (value) => userNotifier.state = user.copyWith(mobileNumber: value),
// //             ),
// //             const SizedBox(height: 50),
// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   GoRouter.of(context).push('/vehicle-registration');
// //                 },
// //                 child: Text('Next'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }




// import 'package:avatii_driver_app/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// class UserInfoScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(userProvider);
//     final userNotifier = ref.read(userProvider.notifier);

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
//             const SizedBox(height: 5),
//             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Enter your name',
//                 suffixIcon: const Icon(Icons.person, color: Colors.grey),
//               ),
//               onChanged: (value) => userNotifier.updateName(value), // Update method
//             ),
//             const SizedBox(height: 15),
//             DropdownButtonFormField<String>(
//               value: user.city,
//               items: _statesAndUTs.map((state) {
//                 return DropdownMenuItem<String>(
//                   value: state,
//                   child: Text(state),
//                 );
//               }).toList(),
//               onChanged: (value) => userNotifier.updateCity(value!), // Update method
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Choose your city',
//               ),
//               isExpanded: true,
//             ),
//             const SizedBox(height: 15),
//             TextField(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Enter your mobile number',
//                 suffixIcon: const Icon(Icons.phone, color: Colors.grey),
//               ),
//               keyboardType: TextInputType.phone,
//               onChanged: (value) => userNotifier.updateMobileNumber(value), // Update method
//             ),
//             const SizedBox(height: 50),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   GoRouter.of(context).push('/vehicle-registration');
//                 },
//                 child: const Text('Next'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final List<String> _statesAndUTs = [
//   // List of states and union territories
// ];


// final List<String> _statesAndUTs = [
//   'Andhra Pradesh',
//   'Arunachal Pradesh',
//   'Assam',
//   'Bihar',
//   'Chhattisgarh',
//   'Goa',
//   'Gujarat',
//   'Haryana',
//   'Himachal Pradesh',
//   'Jharkhand',
//   'Karnataka',
//   'Kerala',
//   'Madhya Pradesh',
//   'Maharashtra',
//   'Manipur',
//   'Meghalaya',
//   'Mizoram',
//   'Nagaland',
//   'Odisha',
//   'Punjab',
//   'Rajasthan',
//   'Sikkim',
//   'Tamil Nadu',
//   'Telangana',
//   'Tripura',
//   'Uttar Pradesh',
//   'Uttarakhand',
//   'West Bengal',
//   'Andaman and Nicobar Islands',
//   'Chandigarh',
//   'Dadra and Nagar Haveli and Daman and Diu',
//   'Lakshadweep',
//   'Delhi',
//   'Puducherry'
// ];



// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class UserInfoScreen extends StatefulWidget {
//   const UserInfoScreen({super.key});

//   @override
//   State<UserInfoScreen> createState() => _UserInfoScreenState();
// }

// class _UserInfoScreenState extends State<UserInfoScreen> {
//   String? _selectedState;

//   // List of Indian states and union territories
//   final List<String> _statesAndUTs = [
//     'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
//     'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
//     'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
//     'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
//     'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
//     'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
//     'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
//     'Delhi', 'Puducherry'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
//             const SizedBox(height: 5),
//             const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Enter your name',
//                 hintStyle: const TextStyle(
//                   color: Color.fromARGB(255, 108, 107, 107),
//                   fontWeight: FontWeight.normal,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.blueAccent),
//                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                 ),
//                 suffixIcon: const Icon(Icons.person,color: Colors.grey,),
//               ),
//               keyboardType: TextInputType.name,
//             ),
//             const SizedBox(height: 15),
//             DropdownButtonFormField<String>(
//               value: _selectedState,
//               items: _statesAndUTs.map((state) {
//                 return DropdownMenuItem<String>(
//                   value: state,
//                   child: Text(state),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedState = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Choose your city',
//                 hintStyle: const TextStyle(
//                   color: Color.fromARGB(255, 108, 107, 107),
//                   fontWeight: FontWeight.normal,
//                 ),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                   borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.blueAccent),
//                   borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                 ),
//               ),
//               isExpanded: true, // Ensures dropdown fits the available width
//             ),
//             const SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 100,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       GoRouter.of(context).push('/vehicle-registration');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF000000),
//                       padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     child: Text('Next', style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white,
//                     )),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? _selectedState;

  // List of Indian states and union territories
  final List<String> _statesAndUTs = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
    'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
    'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
    'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
    'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
    'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Lakshadweep',
    'Delhi', 'Puducherry'
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please enter your details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28)),
            const SizedBox(height: 5),
            const Text('Registration process is very simple', style: TextStyle(color: Color.fromARGB(255, 21, 14, 168), fontWeight: FontWeight.w400, fontSize: 14)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your name',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 108, 107, 107),
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                ),
                suffixIcon: const Icon(Icons.person,color: Colors.grey,),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your age',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 108, 107, 107),
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                ),
                suffixIcon: const Icon(Icons.person,color: Colors.grey,),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your mobile number',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 108, 107, 107),
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                ),
                suffixIcon: const Icon(Icons.person,color: Colors.grey,),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _selectedState,
              items: _statesAndUTs.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Choose your city',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 108, 107, 107),
                  fontWeight: FontWeight.normal,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.06),
                ),
              ),
              isExpanded: true, // Ensures dropdown fits the available width
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/vehicle-registration');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000000),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Next', style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}