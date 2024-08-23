
import 'package:avatii_driver_app/provider/Register_provider.dart';
import 'package:avatii_driver_app/screens/Before%20Login/Onboarding1/onboardingView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
       ChangeNotifierProvider(create: (context) => DriverauthProvider()),


      ],
      child: GetMaterialApp(
 title: 'Registration Form',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        home: OnboardingView(),



),
      
      
      )
      ;
  }
}