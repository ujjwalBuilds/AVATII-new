import 'package:avatii_admin/constants/imageStrings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    context.go('/sign-in');
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
                  image: AssetImage(Aimages.avatiiadminlogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02), // Adjust spacing as a percentage of screen height
          Text(
            '"Empowering Drivers with Every Trip"',
            style: TextStyle(
              fontSize: screenSize.width * 0.04, // Adjust font size as a percentage of screen width
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}





