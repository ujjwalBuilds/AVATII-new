import 'package:avatii/screens/Before%20Login/Log%20In/logInScreen.dart';
import 'package:avatii/screens/Before%20Login/Sign%20In/signIn/signInScreen.dart';
import 'package:avatii/screens/Before%20Login/Onboarding1/onboardingItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  bool isLastPage = false;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        isLastPage = pageController.page == (OnboardingItems().items.length - 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingItems(); // Keep this inside build for state management

    return Scaffold(
      // bottomSheet: Container(
      //   color: Colors.white,
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //   child: isLastPage ? getStartedButton() : buildBottomSheetRow(controller),
      // ),
      bottomSheet: buildBottomSheet(controller),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            final item = controller.items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item.image, fit: BoxFit.cover), // Ensure image fits well
                const SizedBox(height: 15),
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                Text(
                  item.descriptions,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildBottomSheet(OnboardingItems controller) {
    if (currentPage == 2) {
      // Display buttons centered at the bottom on the third screen
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: TextButton(
                onPressed: () => Get.to(()=>SignInScreen()),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: TextButton(
                onPressed: () => Get.to(()=>LogInScreen()),
                child: const Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    } else {
      // Display the usual bottom sheet row for other screens
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: buildBottomSheetRow(controller),
      );
    }
  }


  Widget buildBottomSheetRow(OnboardingItems controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => pageController.jumpToPage(controller.items.length - 1),
          child: const Text("Skip"),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: controller.items.length,
          effect: const WormEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
        TextButton(
          onPressed: () => pageController.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeIn,
          ),
          child: const Text("Next"),
        ),
      ],
    );
  }



  Widget getStartedButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      child: TextButton(
        onPressed: () => Get.to(()=>SignInScreen()),
        child: const Text("Get Started", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'onboardingItems.dart';

// class OnboardingView extends StatefulWidget {
//   const OnboardingView({super.key});

//   @override
//   State<OnboardingView> createState() => _OnboardingViewState();
// }

// class _OnboardingViewState extends State<OnboardingView> {
//   final PageController pageController = PageController();
//   bool isLastPage = false;

//   @override
//   void initState() {
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         isLastPage = pageController.page == (OnboardingItems().items.length - 1);
//       });
//     });
//   }

//   Future<void> _setOnboardingSeen() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('onboarding_seen', true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = OnboardingItems(); // Keep this inside build for state management

//     return Scaffold(
//       bottomSheet: Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: isLastPage ? getStartedButton() : buildBottomSheetRow(controller),
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 15),
//         child: PageView.builder(
//           itemCount: controller.items.length,
//           controller: pageController,
//           itemBuilder: (context, index) {
//             final item = controller.items[index];
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(item.image, fit: BoxFit.cover), // Ensure image fits well
//                 const SizedBox(height: 15),
//                 Text(
//                   item.title,
//                   style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 15),
//                 Text(
//                   item.descriptions,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             );
//           },
//           onPageChanged: (index) {
//             if (index == controller.items.length - 1) {
//               _setOnboardingSeen(); // Set flag when onboarding is completed
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildBottomSheetRow(OnboardingItems controller) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         TextButton(
//           onPressed: () => pageController.jumpToPage(controller.items.length - 1),
//           child: const Text("Skip"),
//         ),
//         SmoothPageIndicator(
//           controller: pageController,
//           count: controller.items.length,
//           effect: const WormEffect(
//             activeDotColor: Colors.black,
//             dotColor: Colors.grey,
//             dotHeight: 8,
//             dotWidth: 8,
//           ),
//         ),
//         TextButton(
//           onPressed: () => pageController.nextPage(
//             duration: const Duration(milliseconds: 250),
//             curve: Curves.easeIn,
//           ),
//           child: const Text("Next"),
//         ),
//       ],
//     );
//   }

//   Widget getStartedButton() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.black,
//       ),
//       width: MediaQuery.of(context).size.width * 0.9,
//       height: 55,
//       child: TextButton(
//         onPressed: () => GoRouter.of(context).push('/sign-in'),
//         child: const Text("Get Started", style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }
