import 'package:avatii_admin/providers.dart';
import 'package:avatii_admin/svgIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationMenu extends ConsumerWidget {
  final Function(int) onItemTapped;

  const NavigationMenu({
    super.key,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    
    
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
              ref.read(selectedIndexProvider.notifier).state = index;
              onItemTapped(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/car_selected.svg',
                  unselectedAssetName: 'assets/icons/car_unselected.svg',
                  isSelected: selectedIndex == 0,
                ),
                label: 'Riders',
              ),
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/verify_selected.svg',
                  unselectedAssetName: 'assets/icons/verify_unselected.svg',
                  isSelected: selectedIndex == 1,
                ),
                label: 'Verification',
              ),
              BottomNavigationBarItem(
                icon: CustomSvgIcon(
                  selectedAssetName: 'assets/icons/driver_profile_selected.svg',
                  unselectedAssetName: 'assets/icons/driver_profile_unselected.svg',
                  isSelected: selectedIndex == 2,
                ),
                label: 'Driver profiles',
              ),
            ],
          ),
        ),
      ),
    );
  }
}