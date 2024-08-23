import 'package:avatii_driver_app/providers.dart';
import 'package:avatii_driver_app/svgIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationMenu extends StatefulWidget {
  final Function(int) onItemTapped;

  const NavigationMenu({
    super.key,
    required this.onItemTapped,
  });

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 11, bottom: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 11, right: 11, bottom: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              widget.onItemTapped(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/sw_selected.svg',
                  unselectedAssetName: 'assets/icons/sw_unselected.svg',
                  isSelected: selectedIndex == 0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/rupee_selected.svg',
                  unselectedAssetName: 'assets/icons/rupee_unselected.svg',
                  isSelected: selectedIndex == 1,
                ),
                label: 'Earnings',
              ),
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/bookings_selected.svg',
                  unselectedAssetName: 'assets/icons/bookings_unselected.svg',
                  isSelected: selectedIndex == 2,
                ),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/profile_selected.svg',
                  unselectedAssetName: 'assets/icons/profile_unselected.svg',
                  isSelected: selectedIndex == 3,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
