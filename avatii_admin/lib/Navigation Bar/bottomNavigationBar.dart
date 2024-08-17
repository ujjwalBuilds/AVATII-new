import 'package:avatii_admin/Navigation%20Bar/bottomNavigationMenu.dart';
import 'package:avatii_admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            context.go('/home-screen');
            break;
          case 1:
            context.go('/verification-screen');
            break;
          case 2:
            context.go('/driver-profile-screen');
            break;
        }
      },
    );
  }
}