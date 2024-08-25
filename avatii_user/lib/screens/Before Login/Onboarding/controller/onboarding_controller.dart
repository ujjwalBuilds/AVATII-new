import 'package:avatii/screens/Before%20Login/Sign%20In/signIn/signInScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Currents Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      Get.offAll(SignInScreen());

     if (kDebugMode) {
      print('========================= GET STORAGE =========================');
      print(storage.read('IsFirstTime'));
    } 

      storage.write('IsFirstTime', false);

     if (kDebugMode) {
      print('========================= GET STORAGE =========================');
      print(storage.read('IsFirstTime'));
    } 
    
      // Get.to(SignInScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
