import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common_widgets/center_loading_bar.dart';
import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final obscurePassword = true.obs;
  var rememberedEmail = ''.obs;

  var password = TextEditingController();
  var username = TextEditingController().obs;
  var rememberMe = false.obs;

  var lockCounter = 0;

  var lockingEmail = '';

  void forgetPassword() {
    Get.focusScope?.unfocus();
    Get.toNamed(Routes.FORGET_PASSWORD);
  }

  void goToRegister() {
    Get.focusScope?.unfocus();
    Get.toNamed(Routes.SIGNUP);
  }

  void login() {
    Get.showOverlay(
        asyncFunction: loginProcess, loadingWidget: const CenterLoadingBar());
  }

  @override
  void onInit() {
    super.onInit();
    username.value = TextEditingController(text: rememberedEmail.value);
  }

  var usernameFocus = FocusNode();
  var passwordFocus = FocusNode();

  @override
  void onClose() {
    super.onClose();
    usernameFocus.dispose();
    passwordFocus.dispose();
  }

  Future<void> loginProcess() async {
    Get.focusScope?.unfocus();
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      await Future.delayed(const Duration(seconds: 1));
      Get.toNamed(Routes.HOME);
    }
    // }
    // lockingEmail = username.value.text.trim();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
