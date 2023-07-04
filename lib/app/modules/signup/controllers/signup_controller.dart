import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common_widgets/center_loading_bar.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final signupFormKey = GlobalKey<FormState>();
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var fName = TextEditingController();
  var lName = TextEditingController();
  var mobileNumber = TextEditingController();
  var emailAddress = TextEditingController();

  var fNameFocus = FocusNode();
  var lNameFocus = FocusNode();
  var emailFocus = FocusNode();
  var mobileFocus = FocusNode();
  var passwordFocus = FocusNode();
  var confirmPasswordFocus = FocusNode();

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.onClose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    fNameFocus.dispose();
    lNameFocus.dispose();
    mobileFocus.dispose();
  }

  String? confirmPasswordValidator(String? value) {
    if (value! != password.text) {
      return 'Password didn\'t match';
    } else {
      return null;
    }
  }

  void registerAccount() {
    Get.showOverlay(
        asyncFunction: signupProcess, loadingWidget: const CenterLoadingBar());
  }

  Future<void> signupProcess() async {
    Get.focusScope?.unfocus();
    if (signupFormKey.currentState!.validate()) {
      signupFormKey.currentState!.save();
      await Future.delayed(const Duration(seconds: 1));
      Get.toNamed(Routes.HOME);
    }
  }

  void goBackToLogin() {
    Get.back();
  }
}
