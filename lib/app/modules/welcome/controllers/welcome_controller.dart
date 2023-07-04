
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class WelcomeController extends GetxController {
  final currentIndex = 0.obs;
  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  next() {
    currentIndex.value++;
    pageController.animateToPage(currentIndex.value,
        duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
  }

  @override
  void onClose() {
    currentIndex.value = 0;
    super.onClose();
  }

  changePageTo(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(currentIndex.value);
  }

  onPageChanged(int index) {
    currentIndex.value = index;
  }

  signup() {
    Get.toNamed(Routes.SIGNUP);
  }
  login() {
    Get.toNamed(Routes.SIGNIN);
  }


}
