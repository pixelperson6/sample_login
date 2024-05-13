import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sample_login/app/core/values/text_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/values/on_boarding_static.dart';
import '../controllers/welcome_controller.dart';
import 'widgets/on_boarding_page.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.onPageChanged(value);
                },
                itemCount: onBoardingList.length,
                itemBuilder: (context, i) => WelcomeOnBoarding(
                  index: i,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: onBoardingList.length,
                    effect: WormEffect(activeDotColor: Get.theme.primaryColor),
                    onDotClicked: (index) {
                      controller.changePageTo(index);
                    },
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ElevatedButton(
                      onPressed: controller.signup,
                      child: const Text(zGetStarted),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //some code added
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: OutlinedButton(
                      onPressed: controller.login,
                      child: const Text(zAlreadyAccount),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
