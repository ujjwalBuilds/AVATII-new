

// import 'package:avatii_driver_app/model/driver_model.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserInfoScreen extends StatefulWidget {
//   const UserInfoScreen({super.key});

//   @override
//   State<UserInfoScreen> createState() => _UserInfoScreenState();
// }

// class _UserInfoScreenState extends State<UserInfoScreen> {
//   final _formKey = GlobalKey<FormState>();

//   String? _selectedState;
//   String? _name;
//   int? _age;
//   String? _phoneNumber;

//   // List of Indian states and union territories
//   final List<String> _statesAndUTs = [
//     'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
//     'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jammu' ,'Jharkhand',
//     'Karnataka','Kashmir' ,'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
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
//       body: SingleChildScrollView(
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Please enter your details',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 28,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     'Registration process is very simple',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 21, 14, 168),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Enter your name',
//                       hintStyle: const TextStyle(
//                         color: Color.fromARGB(255, 108, 107, 107),
//                         fontWeight: FontWeight.normal,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.blueAccent),
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                       ),
//                       suffixIcon: const Icon(Icons.person, color: Colors.grey),
//                     ),
//                     keyboardType: TextInputType.name,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _name = value;
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Enter your age',
//                       hintStyle: const TextStyle(
//                         color: Color.fromARGB(255, 108, 107, 107),
//                         fontWeight: FontWeight.normal,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.blueAccent),
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                       ),
//                       suffixIcon: const Icon(Icons.person, color: Colors.grey),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your age';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _age = int.parse(value??'0');
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Enter your mobile number',
//                       hintStyle: const TextStyle(
//                         color: Color.fromARGB(255, 108, 107, 107),
//                         fontWeight: FontWeight.normal,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.blueAccent),
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                       ),
//                       suffixIcon: const Icon(Icons.person, color: Colors.grey),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your mobile number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _phoneNumber = value;
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   DropdownButtonFormField<String>(
//                     value: _selectedState,
//                     items: _statesAndUTs.map((state) {
//                       return DropdownMenuItem<String>(
//                         value: state,
//                         child: Text(state),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedState = value;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select your city';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Choose your city',
//                       hintStyle: const TextStyle(
//                         color: Color.fromARGB(255, 108, 107, 107),
//                         fontWeight: FontWeight.normal,
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.blueAccent),
//                         borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                       ),
//                     ),
//                     isExpanded: true, // Ensures dropdown fits the available width
//                   ),
//                   const SizedBox(height: 50),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 100,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               // Navigate to vehicle registration screen
//                                 var driver=Driver();
//                                 driver.age=_age;
//                                 driver.name=_name;
//                                 driver.phoneNumber=_phoneNumber;
//                                 driver.city=_selectedState;

//                               Get.to(() => VehicleRegistrationScreen(driver: driver,));
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF000000),
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 15, horizontal: 15),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                           child: const Text(
//                             'Next',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:avatii_driver_app/model/driver_model.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedState;
  String? _name;
  int? _age;
  String? _phoneNumber;

  // List of Indian states and union territories
  final List<String> _statesAndUTs = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jammu', 'Jharkhand',
    'Karnataka', 'Kashmir', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Please enter your details',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Registration process is very simple',
                    style: TextStyle(
                      color: Color.fromARGB(255, 21, 14, 168),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
                      suffixIcon: const Icon(Icons.person, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
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
                      suffixIcon: const Icon(Icons.person, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _age = int.parse(value ?? '0');
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
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
                      suffixIcon: const Icon(Icons.person, color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your city';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Choose your city',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 108, 107, 107),
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 14.0), // Adjust padding to center hint text
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
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Navigate to vehicle registration screen
                              var driver = Driver();
                              driver.age = _age;
                              driver.name = _name;
                              driver.phoneNumber = _phoneNumber;
                              driver.city = _selectedState;

                              Get.to(() => VehicleRegistrationScreen(driver: driver));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF000000),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
