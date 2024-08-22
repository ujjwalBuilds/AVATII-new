// import 'package:avatii_driver_app/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Earnings%20Screen/earningsScreen.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Home%20Screen/homeScreen.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Profile%20Screen/profileScreen.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/Login/otp/sendOtp.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/Login/signIn/signInScreen.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/Onboarding1/onboardingView.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/drivingLicense.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/drivingLicenseNumber.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/profilePicture.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/regCertfUpload.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/uploadDocuments.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/userInfo.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
// import 'package:avatii_driver_app/screens/Before%20Login/splashScreen/splashScreen.dart';
// import 'package:go_router/go_router.dart';

// final GoRouter router = GoRouter(routes: [
//   GoRoute(
//     path: '/',
//     builder: (context, state) => SplashScreen(),
//   ),
//   GoRoute(
//     path: '/onboard',
//     builder: (context, state) => OnboardingView(),
//   ),
//   GoRoute(
//     path: '/sign-in',
//     builder: (context, state) => SignInScreen(),
//   ),
//   GoRoute(
//     path: '/otp-login',
//     builder: (context, state) => OtpLoginScreen(),
//   ),
//   GoRoute(
//     path: '/user-info',
//     builder: (context, state) => UserInfoScreen(),
//   ),
//   // GoRoute(
//   //   path: '/vehicle-registration',
//   //   builder: (context, state) => VehicleRegistrationScreen(onComplete: (String vehicleType, String vehicleRegistrationNumber) { print('Vehicle Type: $vehicleType');
//   //             print('Registration Number: $vehicleRegistrationNumber'); },),
//   // ),
//   GoRoute(
//   path: '/vehicle-registration',
//   builder: (context, state) {
//     return VehicleRegistrationScreen(
//       onComplete: (String vehicleType, String vehicleRegistrationNumber) {
//         // Handle the callback here, for example:
//         print('Vehicle Type: $vehicleType');
//         print('Registration Number: $vehicleRegistrationNumber');
//       },
//     );
//   },
// ),

//   GoRoute(
//     path: '/upload-documents',
//     builder: (context, state) => UploadDocumentsScreen(),
//   ),

//   // Upload docs routes
//   GoRoute(
//     path: '/registration-certficate',
//     builder: (context, state) => RegCertScreen(),
//   ),
//   GoRoute(
//     path: '/driving-license',
//     builder: (context, state) => DrivingLicenseScreen(),
//   ),
//   GoRoute(
//     path: '/driving-license-number',
//     builder: (context, state) => DrivingLicenseNumberScreen(),
//   ),
//   GoRoute(
//     path: '/profile-picture',
//     builder: (context, state) => ProfilePictureScreen(),
//   ),



//   // Main App routes
//   GoRoute(
//     path: '/home-screen',
//     builder: (context, state) => HomeScreen(),
//   ),
//   GoRoute(
//     path: '/earnings-screen',
//     builder: (context, state) => EarningsScreen(),
//   ),
//   GoRoute(
//     path: '/bookings-screen',
//     builder: (context, state) => BookingsScreen(),
//   ),
//   GoRoute(
//     path: '/profile-screen',
//     builder: (context, state) => ProfileScreen(),
//   ),
// ]
// );


import 'package:avatii_driver_app/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
import 'package:avatii_driver_app/screens/After%20Login/Earnings%20Screen/earningsScreen.dart';
import 'package:avatii_driver_app/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii_driver_app/screens/After%20Login/Profile%20Screen/profileScreen.dart';
import 'package:avatii_driver_app/screens/Before%20Login/Login/otp/sendOtp.dart';
import 'package:avatii_driver_app/screens/Before%20Login/Login/signIn/signInScreen.dart';
import 'package:avatii_driver_app/screens/Before%20Login/Onboarding1/onboardingView.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/drivingLicense.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/drivingLicenseNumber.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/profilePicture.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/Upload%20Documents%20components/regCertfUpload.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/uploadDocuments.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/userInfo.dart';
import 'package:avatii_driver_app/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
import 'package:avatii_driver_app/screens/Before%20Login/splashScreen/splashScreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    // Splash Screen
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    
    // Onboarding Screen
    GoRoute(
      path: '/onboard',
      builder: (context, state) => OnboardingView(),
    ),
    
    // Sign-In and OTP Login Screens
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/otp-login',
      builder: (context, state) => OtpLoginScreen(),
    ),
    
    // User Info Screens
    GoRoute(
      path: '/user-info',
      builder: (context, state) => UserInfoScreen(),
    ),
    // GoRoute(
    //   path: '/vehicle-registration',
    //   builder: (context, state) => VehicleRegistrationScreen(
    //     onComplete: (String vehicleType, String vehicleRegistrationNumber) {
    //       print('Vehicle Type: $vehicleType');
    //       print('Registration Number: $vehicleRegistrationNumber');
    //     },
    //   ),
    // ),
    GoRoute(
      path: '/vehicle-registration',
      builder: (context, state) => VehicleRegistrationScreen(),
    ),
    GoRoute(
      path: '/upload-documents',
      builder: (context, state) => UploadDocumentsScreen(),
    ),
    
    // Upload Documents Sub-Screens
    GoRoute(
      path: '/registration-certificate',
      builder: (context, state) => RegCertScreen(),
    ),
    GoRoute(
      path: '/driving-license',
      builder: (context, state) => DrivingLicenseScreen(),
    ),
    GoRoute(
      path: '/driving-license-number',
      builder: (context, state) => DrivingLicenseNumberScreen(),
    ),
    GoRoute(
      path: '/profile-picture',
      builder: (context, state) => ProfilePictureScreen(),
    ),
    
    // Main App Screens
    GoRoute(
      path: '/home-screen',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/earnings-screen',
      builder: (context, state) => EarningsScreen(),
    ),
    GoRoute(
      path: '/bookings-screen',
      builder: (context, state) => BookingsScreen(),
    ),
    GoRoute(
      path: '/profile-screen',
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);
