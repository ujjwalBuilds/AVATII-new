
import 'package:avatii/constants/imageStrings.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/Widgets/onboarding_dot_navigation.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/Widgets/onboarding_next_button.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/Widgets/onboarding_page.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/Widgets/onboarding_skip.dart';
import 'package:avatii/screens/Before%20Login/Onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnboardingPage(
                image: Aimages.hatchback,
                title: 'We Provide professional taxi Services for you',
                subTitle: 'subtitle',
              ),
              OnboardingPage(
                image: Aimages.sedan,
                title: 'We Provide professional taxi Services for you',
                subTitle: 'subtitle',
              ),
              OnboardingPage(
                image: Aimages.hatchback,
                title: 'We Provide professional taxi Services for you',
                subTitle: 'subtitle',
              ),
            ],
          ),

          //Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
