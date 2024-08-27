// import 'package:avatii_driver_app/model/driver_model.dart';
// import 'package:avatii_driver_app/provider/Register_provider.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/Login/signIn/signInScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:provider/provider.dart';

// class UploadDocumentsScreen extends StatefulWidget {
//  Driver driver;

//    UploadDocumentsScreen({super.key,
//    required this.driver
//    });

//   @override
//   State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
// }

// class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
//   final ImagePicker _picker = ImagePicker();
//   File ? profileimage;
//   File? rcimage;
//   File? liscenceImage;
//   Map<String, String?> _selectedImages = {
//     'RC': null,
//     'DL': null,
//     'Profile': null,
//   };



// void submit_Application(){ 
//      widget.driver.drivingLicense=DrivingLicense(licenseNumber: _dlController.text, image: '');


// Provider.of<DriverauthProvider>(context,listen: false).registerwithImage(widget.driver,
//  rcimage
//  ,liscenceImage, 
//  profileimage
//  ).then((_){
// ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Application Submitted successfully")));
// Get.offAll(()=>SignInScreen());

//  }).catchError((onError){
//   ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(onError.toString())));
//  });







// }





//   final TextEditingController _dlController = TextEditingController();
//   final TextEditingController _dlNumberController = TextEditingController();

//   Future<void> _ProfileIMage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//       profileimage=File(image.path);

//       });
//     }
//   }
  
//   Future<void> _rcIMage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//       rcimage=File(image.path);

//       });
//     }
//   }
  
//   Future<void> _licenceIMage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//       liscenceImage=File(image.path);

//       });
//     }
//   }

//   void _submitApplication() {
//     if (rcimage == null) {
//       _showErrorSnackbar('Please upload your Registration Certificate (RC).');
//       return;
//     }

//     if (liscenceImage == null) {
//       _showErrorSnackbar('Please upload your Driving License.');
//       return;
//     }


//     if (_dlNumberController.text.isEmpty) {
//       _showErrorSnackbar('Please enter your Driving License Number.');
//       return;
//     }

//     if (profileimage == null) {
//       _showErrorSnackbar('Please upload your Profile Picture.');
//       return;
//     }

//     // If all checks pass, navigate to the next screen
//    // GoRouter.of(context).push('/sign-in');
//   submit_Application();
  
//   }

//   void _showErrorSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final driverauth=Provider.of<DriverauthProvider>(context);
//     final Size screenSize = MediaQuery.of(context).size;
//     return Stack(
//       children: [
//         Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 150),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Upload Documents',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 28),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       'Please enter the required details',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 21, 14, 168),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14),
//                     ),
//                     const SizedBox(height: 25),
//                     const Text(
//                       'Earnings are only a few steps away',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 71, 70, 70),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15),
//                     ),
//                     const SizedBox(height: 30),
//                     Column(
//                       children: [
//                         ElevatedButton(
//                           onPressed: () => _rcIMage,
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(400, 50),
//                             backgroundColor:
//                                 const Color.fromARGB(255, 241, 237, 237),
//                             elevation: 0.3,
//                             shadowColor: Colors.black,
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                   'Registration Certificate (RC) of your vehicle',
//                                   style: TextStyle(
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.w400),
//                                       overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Icon(
//                                 Icons.credit_card_outlined,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ),
//                         if (_selectedImages['RC'] != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Container(
//                               width: 400,
//                               height: 200,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Colors.grey.withOpacity(0.5)),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.file(
//                                   File(_selectedImages['RC']!),
//                                   fit: BoxFit.cover,
//                                   width: 400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         const SizedBox(height: 15),
//                         ElevatedButton(
//                           onPressed: () => //_selectImage(ImageSource.gallery, 'DL'),
//                           _licenceIMage
                          
//                           ,style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(400, 50),
//                             backgroundColor:
//                                 const Color.fromARGB(255, 241, 237, 237),
//                             elevation: 0.3,
//                             shadowColor: Colors.black,
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Upload your Driving License',
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               SizedBox(width: 8),
//                               Icon(
//                                 Icons.credit_card_outlined,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ),
//                         if (_selectedImages['DL'] != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Container(
//                               width: 400,
//                               height: 200,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Colors.grey.withOpacity(0.5)),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.file(
//                                   File(_selectedImages['DL']!),
//                                   fit: BoxFit.cover,
//                                   width: 400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                        // const SizedBox(height: 15),
                     
//                         const SizedBox(height: 15),
//                         TextField(
//                           controller: _dlNumberController,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Driving License Number',
//                             hintStyle: const TextStyle(
//                               color: Color.fromARGB(255, 108, 107, 107),
//                               fontWeight: FontWeight.normal,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.circular(screenSize.width * 0.06),
//                               borderSide:
//                                   BorderSide(color: Colors.grey.withOpacity(0.5)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: Colors.blueAccent),
//                               borderRadius:
//                                   BorderRadius.circular(screenSize.width * 0.06),
//                             ),
//                             suffixIcon: const Icon(
//                               Icons.person,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           keyboardType: TextInputType.name,
//                         ),
//                         const SizedBox(height: 15),
//                         ElevatedButton(
//                           onPressed: () =>
//                             //  _selectImage(ImageSource.gallery, 'Profile'),
//                         _ProfileIMage
//                           ,style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(400, 50),
//                             backgroundColor:
//                                 const Color.fromARGB(255, 241, 237, 237),
//                             elevation: 0.3,
//                             shadowColor: Colors.black,
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Profile Picture',
//                                 style: TextStyle(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               SizedBox(width: 8),
//                               Icon(
//                                 Icons.photo,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         ),
//                         if (_selectedImages['Profile'] != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Container(
//                               width: 400,
//                               height: 200,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Colors.grey.withOpacity(0.5)),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.file(
//                                   File(_selectedImages['Profile']!),
//                                   fit: BoxFit.cover,
//                                   width: 400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         const SizedBox(height: 30),
//                         Container(
//                           width: 400,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 22, 21, 21),
//                             borderRadius:
//                                 BorderRadius.circular(screenSize.width * 0.06),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: _submitApplication,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromARGB(255, 22, 21, 21),
//                               foregroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                     screenSize.width * 0.06),
//                               ),
//                             ),
//                             child: const Text(
//                               'Submit',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),

// if (driverauth.isLoading)
//           const Opacity(
//             opacity: 0.8,
//             child: ModalBarrier(dismissible: false, color: Colors.black),
//           ),
//         if (driverauth.isLoading)
//           const Center(
//             child: CircularProgressIndicator(),
//           ),




//       ],
//     );
//   }
// }
import 'package:avatii_driver_app/Phone%20OTP%20auth/phoneAuth.dart';
import 'package:avatii_driver_app/model/driver_model.dart';
import 'package:avatii_driver_app/provider/Register_provider.dart';
import 'package:avatii_driver_app/screens/Before%20Login/Login/signIn/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class UploadDocumentsScreen extends StatefulWidget {
  final Driver driver;

  UploadDocumentsScreen({super.key, required this.driver});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  final ImagePicker _picker = ImagePicker();
  File? profileImage;
  File? rcImage;
  File? licenseImage;

  final TextEditingController _dlNumberController = TextEditingController();

  Future<void> _pickProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  Future<void> _pickRcImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        rcImage = File(image.path);
      });
    }
  }

  Future<void> _pickLicenseImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        licenseImage = File(image.path);
      });
    }
  }

  void submitApplication() {
    if (rcImage == null) {
      _showErrorSnackbar('Please upload your Registration Certificate (RC).');
      return;
    }

    if (licenseImage == null) {
      _showErrorSnackbar('Please upload your Driving License.');
      return;
    }

    if (_dlNumberController.text.isEmpty) {
      _showErrorSnackbar('Please enter your Driving License Number.');
      return;
    }

    if (profileImage == null) {
      _showErrorSnackbar('Please upload your Profile Picture.');
      return;
    }

    widget.driver.drivingLicense =
        DrivingLicense(licenseNumber: _dlNumberController.text, image: '');

    Provider.of<DriverauthProvider>(context, listen: false)
        .registerwithImage(widget.driver, rcImage, licenseImage, profileImage)
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Application Submitted successfully")),
      );
      Get.offAll(() => PhoneAuth());
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(onError.toString())),
      );
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final driverauth = Provider.of<DriverauthProvider>(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Upload Documents',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Please enter the required details',
                      style: TextStyle(
                        color: Color.fromARGB(255, 21, 14, 168),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Earnings are only a few steps away',
                      style: TextStyle(
                        color: Color.fromARGB(255, 71, 70, 70),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: _pickRcImage,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                            elevation: 0.3,
                            shadowColor: Colors.black,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Registration Certificate (RC) of your vehicle',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.credit_card_outlined,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        if (rcImage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 400,
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  rcImage!,
                                  fit: BoxFit.cover,
                                  width: 400,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: _pickLicenseImage,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                            elevation: 0.3,
                            shadowColor: Colors.black,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upload your Driving License',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.credit_card_outlined,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        if (licenseImage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 400,
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  licenseImage!,
                                  fit: BoxFit.cover,
                                  width: 400,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _dlNumberController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Driving License Number',
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 108, 107, 107),
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.06),
                              borderSide:
                                  BorderSide(color: Colors.grey.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(
                                  screenSize.width * 0.06),
                            ),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: _pickProfileImage,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(400, 50),
                            backgroundColor: const Color.fromARGB(255, 241, 237, 237),
                            elevation: 0.3,
                            shadowColor: Colors.black,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Profile Picture',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.photo,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        if (profileImage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              width: 400,
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  profileImage!,
                                  fit: BoxFit.cover,
                                  width: 400,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 35),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              submitApplication();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: driverauth.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Submit Application',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
