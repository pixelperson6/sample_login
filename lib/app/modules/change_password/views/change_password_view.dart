
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sample_login/app/core/values/text_strings.dart';

import '../../../core/utils/validators.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(zChangePassword),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.updatePasswordFormKey,
          child: Container(
            height: Get.height - 200,
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
               
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => Visibility(
                        visible: controller.suggestionVisible.value,
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                // "Please Enter strong password",
                                zChangePasswordNote,
                                style: Get.textTheme.bodySmall,
                                textAlign: TextAlign.left,
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.suggestionVisible.value = false;
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Get.theme.colorScheme.onSurface
                                        .withOpacity(0.5),
                                  ))
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Visibility(
                    visible: controller.oldPassVisible,
                    child: Text(
                     zOldPassword,
                      style: Get.textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => Visibility(
                        visible: controller.oldPassVisible,
                        child: TextFormField(
                          controller: controller.oldPassword,
                          validator: ZValidator.passwordValidator,
                          focusNode: controller.oldPasswordFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (term) {
                            controller.oldPasswordFocus.unfocus();
                            FocusScope.of(context)
                                .requestFocus(controller.newPasswordFocus);
                          },
                          obscureText: controller.visibleOldPassword.value,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 18),
                            prefixIcon: Icon(
                              FontAwesomeIcons.lock,
                              size: 14,
                              color: Get.theme.primaryColor.withOpacity(0.25),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.visibleOldPassword.value =
                                      !controller.visibleOldPassword.value;
                                },
                                child: Icon(
                                    controller.visibleOldPassword.value == true
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 18,
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.4)),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    zNewPassword,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => TextFormField(
                        controller: controller.password,
                        obscureText: controller.visiblePassword.value,
                        validator: ZValidator.passwordValidator,
                        focusNode: controller.newPasswordFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (term) {
                          controller.newPasswordFocus.unfocus();
                          FocusScope.of(context)
                              .requestFocus(controller.confirmPasswordFocus);
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            size: 14,
                            color: Get.theme.primaryColor.withOpacity(0.25),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: () {
                                controller.visiblePassword.value =
                                    !controller.visiblePassword.value;
                              },
                              child: Icon(
                                  controller.visiblePassword.value == true
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 18,
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.4)),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    zConfirmPassword,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => TextFormField(
                        controller: controller.confirmPassword,
                        obscureText: controller.visibleConfirmPassword.value,
                        validator: controller.confirmPasswordValidator,
                        focusNode: controller.confirmPasswordFocus,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          controller.changePassword();
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            size: 14,
                            color: Get.theme.primaryColor.withOpacity(0.25),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: () {
                                controller.visibleConfirmPassword.value =
                                    !controller.visibleConfirmPassword.value;
                              },
                              child: Icon(
                                  controller.visibleConfirmPassword.value ==
                                          true
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 18,
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.4)),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 55,
                      width: 300.w,
                      child: ElevatedButton(
                          onPressed: controller.changePassword,
                          child: const Text(zChangePassword)),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
