// import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationMenu.dart';
// import 'package:avatii_driver_app/providers.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Earnings%20Screen/earningsScreen.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Home%20Screen/homeScreen.dart';
// import 'package:avatii_driver_app/screens/After%20Login/Profile%20Screen/profileScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

// class CustomNavigationBar extends ConsumerWidget {
//   const CustomNavigationBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return NavigationMenu(
//       onItemTapped: (index) {
//         ref.read(selectedIndexProvider.notifier).state = index;
//         switch (index) {
//           case 0:
//             Get.to(() => HomeScreen());
//             break;
//           case 1:
//             Get.to(() => EarningsScreen());
//             break;
//           case 2:
//             Get.to(() => BookingsScreen());
//             break;
//           case 3:
//             Get.to(() => ProfileScreen());
//             break;
//         }
//       },
//     );
//   }
// }


import 'package:avatii_driver_app/Navigation%20Bar/bottomNavigationMenu.dart';
import 'package:avatii_driver_app/screens/After%20Login/Bookings%20Screen/bookingsScreen.dart';
import 'package:avatii_driver_app/screens/After%20Login/Earnings%20Screen/earningsScreen.dart';
import 'package:avatii_driver_app/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:avatii_driver_app/screens/After%20Login/Profile%20Screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Get.to(() => const HomeScreen());
        
      case 1:
        Get.to(() => const EarningsScreen());
        
      case 2:
        Get.to(() => const BookingsScreen());
        
      case 3:
        Get.to(() => const ProfileScreen());
        
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(
      onItemTapped: _onItemTapped,
    );
  }
}
