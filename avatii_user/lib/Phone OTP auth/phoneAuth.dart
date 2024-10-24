//Ekdum shi chl rha hai ye neeche 1st vala

// import 'package:avatii/Phone%20OTP%20auth/otpvaliScreen.dart';
// import 'package:avatii/provider/userINfo_provider.dart';
// import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class PhoneAuth extends StatefulWidget {
//   const PhoneAuth({super.key});

//   @override
//   State<PhoneAuth> createState() => _PhoneAuthState();
// }

// class _PhoneAuthState extends State<PhoneAuth> {
//   TextEditingController phoneController = TextEditingController();

// // /*Phle chl rha tha ye ONREGISTER*/
// //   void onregister()async{
// //   await Provider.of<UserProvider>(context, listen: false).loginUser(
// //    phoneController.text).then((_){
// //   //  Get.to(()=>HomeScreen());
// //     /*Iss neeche vale code ko uncomment krdiyo pls end mein */
// //     FirebaseAuth.instance.verifyPhoneNumber(
// //                     verificationCompleted: (PhoneAuthCredential credential) {},
// //                     verificationFailed: (FirebaseAuthException ex) {},
// //                     codeSent: (String verificationid, int? resendtoken) {
// //                       Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(verificationid: verificationid,)));
// //                     },
// //                     codeAutoRetrievalTimeout: (String verificationId) {},
// //                     phoneNumber: "+91${phoneController.text.toString()}");
// //    }).catchError((error){
// //     ScaffoldMessenger(child: Text(error.toString()));
// //    }
// //    );
// //   }

//   void onregister() async {
//     try {
//       await Provider.of<UserProvider>(context, listen: false).loginUser(phoneController.text).then((_) {
//         FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: "+91${phoneController.text}",
//           verificationCompleted: (PhoneAuthCredential credential) {
//             // You can auto-sign in here if you want
//           },
//           verificationFailed: (FirebaseAuthException ex) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(ex.message ?? "Verification failed")),
//             );
//           },
//           codeSent: (String verificationId, int? resendToken) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => OTPScreen(verificationid: verificationId),
//               ),
//             );
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {},
//         );
//       });
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(error.toString())),
//       );
//     }
//   }

// // }
//   // @override
//   // Widget build(BuildContext context) {
//   //   final Size screenSize = MediaQuery.of(context).size;
//   //   final userprovider=Provider.of<UserProvider>(context);

//   //   return Scaffold(
//   //     backgroundColor: const Color(0xFFF2F2F5),
//   //     body: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: [
//   //         Padding(
//   //           padding: const EdgeInsets.symmetric(horizontal: 25),
//   //           child: TextField(
//   //             controller: phoneController,
//   //             keyboardType: TextInputType.number,
//   //             decoration: InputDecoration(
//   //                 hintText: "Enter Phone Number",
//   //                 suffixIcon: Icon(Icons.phone),
//   //                 border: OutlineInputBorder(
//   //                   borderRadius: BorderRadius.circular(24),
//   //                 )),
//   //           ),
//   //         ),
//   //         SizedBox(height: 30),
//   //         ElevatedButton(
//   //             onPressed: () => onregister,
//   //             child: Text('Verify Phone Number'))
//   //       ],
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final userprovider = Provider.of<UserProvider>(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F5),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
//             child: Column(
//               children: [
//                 SizedBox(height: screenSize.height * 0.2),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Avatii',
//                       style: TextStyle(
//                         color: const Color(0xFFF212121),
//                         fontSize: screenSize.width * 0.1,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenSize.height * 0.02),

//                 // Sign In Form
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(screenSize.width * 0.04),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(screenSize.width * 0.08),
//                     color: const Color.fromARGB(255, 229, 229, 229).withOpacity(0.4),
//                     border: Border.all(
//                       width: 0.7,
//                       color: const Color.fromARGB(255, 175, 175, 175),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Login to Avatii',
//                         style: TextStyle(
//                           fontSize: screenSize.width * 0.07,
//                           fontWeight: FontWeight.w600,
//                           color: const Color.fromARGB(255, 116, 116, 116),
//                         ),
//                       ),

//                       SizedBox(height: screenSize.height * 0.03),

//                       TextField(
//                         controller: phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: 'Enter Mobile number',
//                           hintStyle: const TextStyle(
//                             color: Color.fromARGB(255, 108, 107, 107),
//                             fontWeight: FontWeight.normal,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                             borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.blueAccent),
//                             borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                           ),
//                           suffixIcon: const Icon(Icons.arrow_forward_rounded),
//                         ),
//                       ),
//                       SizedBox(height: screenSize.height * 0.02),

//                       // Continue Button
//                       userprovider.isLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                               onPressed: () {
//                                 print('function hitted');
//                                 onregister();
//                               },
//                               style: ButtonStyle(
//                                 backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF000000)),
//                               ),
//                               child: const Text(
//                                 'Send  OTP',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                       SizedBox(height: screenSize.height * 0.02),
//                     ],
//                   ),
//                 ),

//                 // Spacer to push the text to the bottom
//                 SizedBox(height: screenSize.height * 0.3),

//                 // Footer text
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'By proceeding you agree to our',
//                             style: TextStyle(
//                               color: const Color(0xFF000000),
//                               fontWeight: FontWeight.w500,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             'Terms & conditions',
//                             style: TextStyle(
//                               color: const Color(0xFF7C54E9),
//                               fontWeight: FontWeight.w500,
//                               decoration: TextDecoration.underline,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'and confirm you have read our',
//                             style: TextStyle(
//                               color: const Color(0xFF000000),
//                               fontWeight: FontWeight.w500,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             'Privacy Policy',
//                             style: TextStyle(
//                               color: const Color(0xFF7C54E9),
//                               fontWeight: FontWeight.w500,
//                               decoration: TextDecoration.underline,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






















// import 'package:avatii/Phone%20OTP%20auth/otpvaliScreen.dart';
// import 'package:avatii/provider/userINfo_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PhoneAuth extends StatefulWidget {
//   const PhoneAuth({Key? key}) : super(key: key);

//   @override
//   State<PhoneAuth> createState() => _PhoneAuthState();
// }

// class _PhoneAuthState extends State<PhoneAuth> {
//   TextEditingController phoneController = TextEditingController();

//   void onregister() async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);

//     try {
//       await userProvider.loginUser(phoneController.text);

//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: "+91${phoneController.text}",
//         verificationCompleted: (PhoneAuthCredential credential) {},
//         verificationFailed: (FirebaseAuthException ex) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Verification failed: ${ex.message}")),
//           );
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OTPScreen(verificationid: verificationId),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(error.toString())),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final userProvider = Provider.of<UserProvider>(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F5),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
//             child: Column(
//               children: [
//                 SizedBox(height: screenSize.height * 0.2),
//                 Text(
//                   'Avatii',
//                   style: TextStyle(
//                     color: const Color(0xFFF212121),
//                     fontSize: screenSize.width * 0.1,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: screenSize.height * 0.02),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(screenSize.width * 0.04),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(screenSize.width * 0.08),
//                     color: const Color.fromARGB(255, 229, 229, 229).withOpacity(0.4),
//                     border: Border.all(
//                       width: 0.7,
//                       color: const Color.fromARGB(255, 175, 175, 175),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Login to Avatii',
//                         style: TextStyle(
//                           fontSize: screenSize.width * 0.07,
//                           fontWeight: FontWeight.w600,
//                           color: const Color.fromARGB(255, 116, 116, 116),
//                         ),
//                       ),
//                       SizedBox(height: screenSize.height * 0.03),
//                       TextField(
//                         controller: phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: 'Enter Mobile number',
//                           hintStyle: const TextStyle(
//                             color: Color.fromARGB(255, 108, 107, 107),
//                             fontWeight: FontWeight.normal,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                             borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.blueAccent),
//                             borderRadius: BorderRadius.circular(screenSize.width * 0.06),
//                           ),
//                           suffixIcon: const Icon(Icons.arrow_forward_rounded),
//                         ),
//                       ),
//                       SizedBox(height: screenSize.height * 0.02),
//                       userProvider.isLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                               onPressed: onregister,
//                               style: ButtonStyle(
//                                 backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF000000)),
//                               ),
//                               child: const Text(
//                                 'Send OTP',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                       SizedBox(height: screenSize.height * 0.02),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenSize.height * 0.3),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'By proceeding you agree to our',
//                             style: TextStyle(
//                               color: const Color(0xFF000000),
//                               fontWeight: FontWeight.w500,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             'Terms & conditions',
//                             style: TextStyle(
//                               color: const Color(0xFF7C54E9),
//                               fontWeight: FontWeight.w500,
//                               decoration: TextDecoration.underline,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'and confirm you have read our',
//                             style: TextStyle(
//                               color: const Color(0xFF000000),
//                               fontWeight: FontWeight.w500,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             'Privacy Policy',
//                             style: TextStyle(
//                               color: const Color(0xFF7C54E9),
//                               fontWeight: FontWeight.w500,
//                               decoration: TextDecoration.underline,
//                               fontSize: screenSize.width * 0.033,
//                             ),
//                           ),
//                         ],
//       ),
//     // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }













// New code with test phone numbers

import 'package:avatii/Phone%20OTP%20auth/otpvaliScreen.dart';
import 'package:avatii/provider/userINfo_provider.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();

  // List of test phone numbers
  final List<String> testNumbers = [
    '+16505550000',
    '+16505551111',
    '+16505552222',
  ];

  // Function to check if number is a test number
  bool isTestNumber(String number) {
    // Remove any spaces, dashes or special characters for comparison
    String cleanNumber = number.replaceAll(RegExp(r'[\s-]'), '');
    return testNumbers.contains(cleanNumber);
  }

  // Function to format phone number
  String formatPhoneNumber(String number) {
    // Remove any spaces or special characters
    String cleanNumber = number.replaceAll(RegExp(r'[\s-]'), '');

    // If number already starts with +, return as is
    if (cleanNumber.startsWith('+')) {
      return cleanNumber;
    }

    // Add Indian prefix for numbers without country code
    return '+91$cleanNumber';
  }

  void onregister() async {
    try {
      String phoneNumber = formatPhoneNumber(phoneController.text);

      // Check if it's a test number
      if (isTestNumber(phoneNumber)) {
        print("Test number detected: $phoneNumber");
        // For test numbers, skip actual verification and proceed to home screen
        await Provider.of<UserProvider>(context, listen: false).loginUser(phoneNumber);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        return;
      }

      // For regular numbers, proceed with normal verification
      await Provider.of<UserProvider>(context, listen: false).loginUser(phoneNumber).then((_) {
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            // Auto-sign in if supported
          },
          verificationFailed: (FirebaseAuthException ex) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ex.message ?? "Verification failed")),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(verificationid: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final userprovider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Avatii',
                      style: TextStyle(
                        color: const Color(0xFFF212121),
                        fontSize: screenSize.width * 0.1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02),

                // Sign In Form
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenSize.width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenSize.width * 0.08),
                    color: const Color.fromARGB(255, 229, 229, 229).withOpacity(0.4),
                    border: Border.all(
                      width: 0.7,
                      color: const Color.fromARGB(255, 175, 175, 175),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Login to Avatii',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.07,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 116, 116, 116),
                        ),
                      ),

                      SizedBox(height: screenSize.height * 0.03),

                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter phone number with country code',
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
                          suffixIcon: const Icon(Icons.arrow_forward_rounded),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),

                      // Continue Button
                      userprovider.isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                print('function hitted');
                                onregister();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF000000)),
                              ),
                              child: const Text(
                                'Send OTP',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                      SizedBox(height: screenSize.height * 0.02),
                    ],
                  ),
                ),

                // Spacer to push the text to the bottom
                SizedBox(height: screenSize.height * 0.3),

                // Footer text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By proceeding you agree to our',
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Terms & conditions',
                            style: TextStyle(
                              color: const Color(0xFF7C54E9),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'and confirm you have read our',
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: const Color(0xFF7C54E9),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontSize: screenSize.width * 0.033,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
