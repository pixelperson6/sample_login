import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/common_widgets/center_loading_bar.dart';
import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  final updatePasswordFormKey = GlobalKey<FormState>();
  final bool oldPassVisible = Get.arguments[0];
  final String userName = Get.arguments[1];

  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var oldPassword = TextEditingController();

  var visiblePassword = true.obs;
  var visibleOldPassword = true.obs;
  var visibleConfirmPassword = true.obs;

  var suggestionVisible = true.obs;

  var confirmPasswordFocus = FocusNode();
  var newPasswordFocus = FocusNode();
  var oldPasswordFocus = FocusNode();

  void changePassword() {
    Get.showOverlay(
        asyncFunction: updatePassword, loadingWidget: const CenterLoadingBar());
  }

  Future<void> updatePassword() async {
    final isValid = updatePasswordFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      updatePasswordFormKey.currentState!.save();

      if (oldPassVisible) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.WELCOME);
      }
      Get.snackbar('Success', 'Password changed successfully');
    } else {
      // Get.snackbar('Error', 'Something went wrong, try again');
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.onClose();
    oldPasswordFocus.dispose();
    newPasswordFocus.dispose();
    confirmPasswordFocus.dispose();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  String? confirmPasswordValidator(String? value) {
    if (value! != password.text) {
      return 'Password didn\'t match';
    } else {
      return null;
    }
  }
}
