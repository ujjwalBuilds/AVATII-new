import 'package:avatii/constants/imageStrings.dart';
import 'package:avatii/screens/Before%20Login/Onboarding1/onboardingView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    // Use GoRouter for navigation
    //context.go('/onboard');
  Get.to(()=>OnboardingView());
  
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: screenSize.width * 0.5, // Adjust width as a percentage of screen width
              height: screenSize.height * 0.3, // Adjust height as a percentage of screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Aimages.avatiilogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02), // Adjust spacing as a percentage of screen height
          Text(
            '"One App for all your cab needs"',
            style: TextStyle(
              fontSize: screenSize.width * 0.05, // Adjust font size as a percentage of screen width
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}





// import 'package:avatii/constants/imageStrings.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToNextScreen();
//   }

//   Future<void> _navigateToNextScreen() async {
//     await Future.delayed(Duration(seconds: 3), () {});
//     final prefs = await SharedPreferences.getInstance();
//     final onboardingSeen = prefs.getBool('onboarding_seen') ?? false;

//     if (onboardingSeen) {
//       context.go('/sign-in'); // Navigate to the sign-in page if onboarding has been seen
//     } else {
//       context.go('/onboard'); // Navigate to onboarding if it hasn't been seen
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               width: screenSize.width * 0.5,
//               height: screenSize.height * 0.3,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(Aimages.avatiilogo),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: screenSize.height * 0.02),
//           Text(
//             '"One App for all your cab needs"',
//             style: TextStyle(
//               fontSize: screenSize.width * 0.05,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
