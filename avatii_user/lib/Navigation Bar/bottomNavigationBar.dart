import 'package:avatii/Navigation%20Bar/bottomNavigationMenu.dart';
import 'package:avatii/providers.dart';
import 'package:avatii/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii/screens/After%20Login/Profile%20Screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(
      onItemTapped: (index) {
        setState(() {
          selectedIndex = index;
        });

        switch (index) {
          case 0:
            Get.to(() => HomeScreen());
            break;
          case 1:
            Get.to(() => BookingsScreen());
            break;
          case 2:
            Get.to(() => ProfileScreen());
            break;
        }
      },
    );
  }
}
