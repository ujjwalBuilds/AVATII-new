
import 'package:avatii/provider/Ride_provider.dart';
import 'package:avatii/provider/journeyINfoprovider.dart';
import 'package:avatii/provider/userINfo_provider.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii/screens/Before%20Login/splashScreen/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MainApp());
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
   return MultiProvider(providers: [ 
    
    ChangeNotifierProvider(
            create: (context) => UserProvider()..tryAutoLogin()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => RideProvider()),
     ChangeNotifierProvider(create: (context) => CostingProvider())
   
   
   ],
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
