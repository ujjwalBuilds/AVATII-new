import 'package:avatii/Navigation%20Bar/bottomNavigationMenu.dart';
import 'package:avatii/providers.dart';
import 'package:avatii/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
import 'package:avatii/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii/screens/After%20Login/Profile%20Screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends ConsumerWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationMenu(
      onItemTapped: (index) {
        ref.read(selectedIndexProvider.notifier).state = index;
        switch (index) {
          case 0:
            //context.go('/home-screen');
           Get.to(()=>HomeScreen());
            break;
          case 1:
            // context.go('/bookings-screen');
            Get.to(()=>BookingsScreen());
            break;
          case 2:
           // context.go('/profile-screen');
             Get.to(()=>ProfileScreen());
            break;
        }
      },
    );
  }
}