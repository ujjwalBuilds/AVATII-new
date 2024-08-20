import 'package:avatii/constants/colors.dart';
import 'package:avatii/constants/helper_functions.dart';
import 'package:avatii/constants/sizes.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/Widgets/device_utility.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : TColors.primary,
          ),
          child: const Icon(Iconsax.arrow_right_3),
        ),
        );
  }
}