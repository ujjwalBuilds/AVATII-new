import 'package:avatii_driver_app/model/Ride_model.dart';
import 'package:avatii_driver_app/provider/DriverProvider.dart';
import 'package:avatii_driver_app/provider/JourneyProvider.dart';
import 'package:avatii_driver_app/provider/Register_provider.dart';
import 'package:avatii_driver_app/provider/Ride_request_provider.dart';
import 'package:avatii_driver_app/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii_driver_app/screens/Before%20Login/Onboarding1/onboardingView.dart';
import 'package:avatii_driver_app/screens/Before%20Login/splashScreen/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
      ChangeNotifierProvider(create: (context) => DriverauthProvider()..tryAutoLogin()),
      // ChangeNotifierProvider(create: (context) => DriverauthProvider()),
      ChangeNotifierProvider(create: (context) => DriverProvider()),
      ChangeNotifierProvider(create: (context) => RideRequestProvider()),
      ChangeNotifierProvider(create: (context) => JourneyProvider()),
      
      
      ],
      child: GetMaterialApp(
        title: 'Registration Form',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        // home: OnboardingView(),
        home: Consumer<DriverauthProvider>(
          builder: (context, authProvider, _) {
            if (authProvider.isAuth) {
              // If the user is authenticated, navigate to the main screen
              return HomeScreen();
            } else {
              // If the user is not authenticated, show the onboarding screen
              return OnboardingView();
            }
          },
        ),

),
      
      
      )
      ;
  }
}