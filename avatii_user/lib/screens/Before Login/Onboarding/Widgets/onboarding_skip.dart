import 'package:avatii/constants/sizes.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/Widgets/device_utility.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TDeviceUtils.getAppBarHeight(),
    right: TSizes.defaultSpace,
    child: TextButton(onPressed: ()=>OnBoardingController.instance.skipPage(), child: const Text('Skip'),
    ));
  }
}