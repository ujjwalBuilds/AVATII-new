// import 'package:avatii/Routes/routes.dart';
import 'package:avatii/provider/userINfo_provider.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii/screens/Before%20Login/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart'; 
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     fontFamily: 'Poppins',
    //   ),
    //   routerConfig: router, 
    // );
   return MultiProvider(providers: [ ChangeNotifierProvider(create: (context) => UserinfoProvider()),],
   child:  GetMaterialApp(
 title: 'Registration Form',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
        ),
      home: SplashScreen(),



),
   
   );
  
  }
}
