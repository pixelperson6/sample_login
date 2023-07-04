import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/common_widgets/center_loading_bar.dart';
import '../../../routes/app_pages.dart';

class ForgetPasswordController extends GetxController {
  final count = 0.obs;

  var username = TextEditingController();

  Timer? countdownTimer;

  var forgetPasswordKey = GlobalKey<FormState>();

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 6
  void setCountDown() {
    count.value--;
    if (count.value == 0) {
      countdownTimer!.cancel();
    }
  }

  var otpSent = false.obs;

  void sendOTP() {
    Get.showOverlay(
        asyncFunction: sendOtpProcess, loadingWidget: const CenterLoadingBar());
  }

  Future<void> sendOtpProcess() async {
    Get.focusScope?.unfocus();
    if (forgetPasswordKey.currentState!.validate()) {
      forgetPasswordKey.currentState!.save();
      // final forgotModel = await AuthRepository.instance
      //     .forgotPassword(email: username.text.trim());
      // if (forgotModel == null) {
      //   Get.snackbar(
      //     'error',
      //     'Someting went wrong, please try again',
      //     backgroundColor: Get.theme.colorScheme.error,
      //   );
      // } else {
      //   if (forgotModel.statusCode == 1) {
          count.value = 60;
          otpSent.value = true;
          startTimer();
        // } else {
        //   Get.snackbar(
        //     'error',
        //     'User not found, enter valid email',
        //     backgroundColor: Get.theme.colorScheme.error,
        //   );
        // }
      // }
    }
  }

  var otpCode = ''.obs;

  void verifyOTP() {
    Get.showOverlay(
        asyncFunction: verifyOtpProcess,
        loadingWidget: const CenterLoadingBar());
  }

  Future<void> verifyOtpProcess() async {
    // var otpModel = await AuthRepository.instance.verifyOtp(otpCode.value);
    // if (otpModel?.statusCode == 1) {
      Get.focusScope?.unfocus();
      Get.toNamed(Routes.CHANGE_PASSWORD,
          arguments: [false, username.text.trim()]);
    // } 
    // else {
    //   Get.snackbar(
    //     'error',
    //     'Please enter correct otp',
    //     backgroundColor: Get.theme.colorScheme.error,
    //   );
    // }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
