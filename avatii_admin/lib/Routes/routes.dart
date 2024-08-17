import 'package:avatii_admin/screens/After%20Login/Driver%20Profiles%20Screen/driverProfileScreen.dart';
import 'package:avatii_admin/screens/After%20Login/Verification%20Screen/verificationScreen.dart';
import 'package:avatii_admin/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii_admin/screens/Before%20Login/Login/otp/sendOtp.dart';
import 'package:avatii_admin/screens/Before%20Login/Login/signIn/signInScreen.dart';
import 'package:avatii_admin/screens/Before%20Login/Onboarding1/onboardingView.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/Upload%20Documents%20components/drivingLicense.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/Upload%20Documents%20components/drivingLicenseNumber.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/Upload%20Documents%20components/profilePicture.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/Upload%20Documents%20components/regCertfUpload.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/uploadDocuments.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/userInfo.dart';
import 'package:avatii_admin/screens/Before%20Login/User%20Info/vehicleRegistration.dart';
import 'package:avatii_admin/screens/Before%20Login/splashScreen/splashScreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: '/onboard',
    builder: (context, state) => OnboardingView(),
  ),
  GoRoute(
    path: '/sign-in',
    builder: (context, state) => SignInScreen(),
  ),
  GoRoute(
    path: '/otp-login',
    builder: (context, state) => OtpLoginScreen(),
  ),
  GoRoute(
    path: '/user-info',
    builder: (context, state) => UserInfoScreen(),
  ),
  GoRoute(
    path: '/vehicle-registration',
    builder: (context, state) => VehicleRegistrationScreen(),
  ),
  GoRoute(
    path: '/upload-documents',
    builder: (context, state) => UploadDocumentsScreen(),
  ),

  // Upload docs routes
  GoRoute(
    path: '/registration-certficate',
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



  // Main App routes
  GoRoute(
    path: '/home-screen',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/verification-screen',
    builder: (context, state) => VerificationScreen(),
  ),
  GoRoute(
    path: '/driver-profile-screen',
    builder: (context, state) => DriverProfileScreen(),
  ),
]
);
