// import 'package:avatii/Phone%20OTP%20auth/phoneAuth.dart';
// import 'package:avatii/screens/Before%20Login/Onboarding1/onboardingItems.dart';
// import 'package:avatii/screens/Before%20Login/User%20Info/userInfo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingView extends StatefulWidget {
//   const OnboardingView({super.key});

//   @override
//   State<OnboardingView> createState() => _OnboardingViewState();
// }

// class _OnboardingViewState extends State<OnboardingView> {
//   final PageController pageController = PageController();
//   bool isLastPage = false;
//   int currentPage = 0;  // Added this line

//   @override
//   void initState() {
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         currentPage = pageController.page?.round() ?? 0;
//         isLastPage = currentPage == (OnboardingItems().items.length - 1);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = OnboardingItems();

//     return Scaffold(
//       bottomSheet: buildBottomSheet(controller),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 15),
//         child: PageView.builder(
//           itemCount: controller.items.length,
//           controller: pageController,
//           onPageChanged: (index) {
//             setState(() {
//               currentPage = index;
//             });
//           },
//           itemBuilder: (context, index) {
//             final item = controller.items[index];
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(item.image, fit: BoxFit.cover),
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
//         ),
//       ),
//     );
//   }

//   Widget buildBottomSheet(OnboardingItems controller) {
//     if (currentPage == 2) {
//       // Display buttons centered at the bottom on the third screen
//       return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.white,
//                 border: Border.all(color: Colors.black),
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: 55,
//               child: TextButton(
//                 onPressed: () => Get.to(()=>UserInfoScreen()),
//                 child: const Text(
//                   "Register",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.black,
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: 55,
//               child: TextButton(
//                 onPressed: () => Get.to(()=>PhoneAuth()),
//                 child: const Text("Login", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       );
//     } else {
//       // Display the usual bottom sheet row for other screens
//       return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: buildBottomSheetRow(controller),
//       );
//     }
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
// }










// import 'package:avatii/Phone%20OTP%20auth/phoneAuth.dart';
// import 'package:avatii/screens/Before%20Login/Onboarding1/onboardingItems.dart';
// import 'package:avatii/screens/Before%20Login/User%20Info/userInfo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingView extends StatefulWidget {
//   const OnboardingView({super.key});

//   @override
//   State<OnboardingView> createState() => _OnboardingViewState();
// }

// class _OnboardingViewState extends State<OnboardingView> {
//   final PageController pageController = PageController();
//   bool isLastPage = false;
//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         currentPage = pageController.page?.round() ?? 0;
//         isLastPage = currentPage == (OnboardingItems().items.length - 1);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = OnboardingItems();

//     return Scaffold(
//       bottomSheet: buildBottomSheet(controller),
//       body: Container(
//         color: isLastPage ? Colors.blue : Colors.white, // Apply blue background on the last page
//         margin: const EdgeInsets.symmetric(horizontal: 15),
//         child: PageView.builder(
//           itemCount: controller.items.length,
//           controller: pageController,
//           onPageChanged: (index) {
//             setState(() {
//               currentPage = index;
//             });
//           },
//           itemBuilder: (context, index) {
//             final item = controller.items[index];
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(item.image, fit: BoxFit.cover),
//                 const SizedBox(height: 15),
//                 Text(
//                   item.title,
//                   style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 15),
//                 Text(
//                   item.descriptions,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: isLastPage ? Colors.white : Colors.black), // White text on blue background
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildBottomSheet(OnboardingItems controller) {
//     if (currentPage == 2) {
//       return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.white,
//                 border: Border.all(color: Colors.black),
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: 55,
//               child: TextButton(
//                 onPressed: () => Get.to(() => UserInfoScreen()),
//                 child: const Text(
//                   "Register",
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.black,
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: 55,
//               child: TextButton(
//                 onPressed: () => Get.to(() => PhoneAuth()),
//                 child: const Text("Login", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: buildBottomSheetRow(controller),
//       );
//     }
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
// }






import 'package:avatii/Phone%20OTP%20auth/phoneAuth.dart';
import 'package:avatii/screens/Before%20Login/Onboarding1/onboardingItems.dart';
import 'package:avatii/screens/Before%20Login/Sign%20In/signIn/signInScreen.dart';
import 'package:avatii/screens/Before%20Login/User%20Info/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        currentPage = pageController.page?.round() ?? 0;
        isLastPage = currentPage == (OnboardingItems().items.length - 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingItems();

    return Scaffold(
      bottomSheet: buildBottomSheet(controller),
      body: Container(
        color: isLastPage ? Color.fromARGB(255, 32, 83, 138) : Colors.white, // Apply blue background on the last page
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          itemCount: controller.items.length,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final item = controller.items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item.image, fit: BoxFit.cover),
                const SizedBox(height: 15),
                if (item.title != null) // Check if title is not null
                  Text(
                    item.title!,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                const SizedBox(height: 15),
                if (item.descriptions != null) // Check if descriptions is not null
                  Text(
                    item.descriptions!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: isLastPage ? Colors.white : Colors.black),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildBottomSheet(OnboardingItems controller) {
    if (isLastPage) {
      return Container(
        color: Color(0xFF20548C),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
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
                onPressed: () => Get.to(() => SignInScreen()),
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
                onPressed: () => Get.to(() => PhoneAuth()),
                child: const Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    } else {
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
}










