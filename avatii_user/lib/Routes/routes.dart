import 'package:avatii/map_page.dart';
import 'package:avatii/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii/screens/After%20Login/Profile%20Screen/profileScreen.dart';
import 'package:avatii/screens/Before%20Login/Login/otp/sendOtp.dart';
import 'package:avatii/screens/Before%20Login/Login/signIn/signInScreen.dart';
import 'package:avatii/screens/Before%20Login/Onboarding1/onboardingView.dart';
import 'package:avatii/screens/Before%20Login/User%20Info/userInfo.dart';
import 'package:avatii/screens/Before%20Login/splashScreen/splashScreen.dart';
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
    path: '/map-page',
    builder: (context, state) => MapPage(),
  ),
  GoRoute(
    path: '/user-info',
    builder: (context, state) => UserInfoScreen(),
  ),
  GoRoute(
    path: '/home-screen',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/bookings-screen',
    builder: (context, state) => BookingsScreen(),
  ),
  GoRoute(
    path: '/profile-screen',
    builder: (context, state) => ProfileScreen(),
  ),
]
);
