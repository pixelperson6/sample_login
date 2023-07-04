import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sample_login/app/core/values/text_strings.dart';

import '../../../core/utils/validators.dart';
import '../../../core/values/image_strings.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20.0,
              )),
          title: const Text(zSignup),
          centerTitle: true,
        ),
      body: Form(
        key: controller.signupFormKey,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ZImageAssets.screenBg), fit: BoxFit.fill),
          ),
          height: Get.height,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset(
                    ZImageAssets.logo,
                    height: 90.h,
                    width: 90.h,
                  )),
                  SizedBox(
                    height: 12.h,
                  ),
                 
                  Center(
                    child: Text(
                      zLoginSubTitle,
                      style: Get.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              zFirstName,
                              style: Get.textTheme.labelLarge,
                            ),
                            SizedBox(height: 5.h),
                            TextFormField(
                              controller: controller.fName,
                              validator: ZValidator.stringValidator,
                              focusNode: controller.fNameFocus,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (term) {
                                controller.fNameFocus.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(controller.lNameFocus);
                              },
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 18),
                                // prefixIcon: Icon(
                                //   FontAwesomeIcons.envelope,
                                //   size: 14,
                                //   color:
                                //       Get.theme.primaryColor.withOpacity(0.25),
                                // ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              zLastName,
                              style: Get.textTheme.labelLarge,
                            ),
                            SizedBox(height: 5.h),
                            TextFormField(
                              controller: controller.lName,
                              validator: ZValidator.stringValidator,
                              focusNode: controller.lNameFocus,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (term) {
                                controller.lNameFocus.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(controller.mobileFocus);
                              },
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 18),
                                // prefixIcon: Icon(
                                //   FontAwesomeIcons.envelope,
                                //   size: 14,
                                //   color:
                                //       Get.theme.primaryColor.withOpacity(0.25),
                                // ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    zPhoneNo,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: controller.mobileNumber,
                    validator: ZValidator.numberValidator,
                    focusNode: controller.mobileFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      controller.mobileFocus.unfocus();
                      FocusScope.of(context)
                          .requestFocus(controller.emailFocus);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                      // prefixIcon: Icon(
                      //   FontAwesomeIcons.envelope,
                      //   size: 14,
                      //   color:
                      //       Get.theme.primaryColor.withOpacity(0.25),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    zEmail,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: controller.emailAddress,
                    validator: ZValidator.emailValidator,
                    focusNode: controller.emailFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      controller.emailFocus.unfocus();
                      FocusScope.of(context)
                          .requestFocus(controller.passwordFocus);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                      // prefixIcon: Icon(
                      //   FontAwesomeIcons.envelope,
                      //   size: 14,
                      //   color:
                      //       Get.theme.primaryColor.withOpacity(0.25),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    zPassword,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => TextFormField(
                        controller: controller.password,
                        obscureText: controller.obscurePassword.value,
                        validator: ZValidator.passwordValidator,
                        focusNode: controller.passwordFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          controller.passwordFocus.unfocus();
                          FocusScope.of(context)
                              .requestFocus(controller.confirmPasswordFocus);
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          // prefixIcon: Icon(
                          //   FontAwesomeIcons.lock,
                          //   size: 14,
                          //   color: Get.theme.primaryColor.withOpacity(0.25),
                          // ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: () {
                                controller.obscurePassword.value =
                                    !controller.obscurePassword.value;
                              },
                              child: Icon(
                                  controller.obscurePassword.value
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
                    height: 12.h,
                  ),
                  Text(
                    zConfirmPassword,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => TextFormField(
                        controller: controller.confirmPassword,
                        obscureText: controller.obscureConfirmPassword.value,
                        validator: controller.confirmPasswordValidator,
                        focusNode: controller.confirmPasswordFocus,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          controller.registerAccount();
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          // prefixIcon: Icon(
                          //   FontAwesomeIcons.lock,
                          //   size: 14,
                          //   color: Get.theme.primaryColor.withOpacity(0.25),
                          // ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: () {
                                controller.obscureConfirmPassword.value =
                                    !controller.obscureConfirmPassword.value;
                              },
                              child: Icon(
                                  controller.obscureConfirmPassword.value
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
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ElevatedButton(
                        onPressed: controller.registerAccount,
                        child: const Text(zSignup)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(zAlreadyAccountQuestion,
                          style: Get.textTheme.labelLarge),
                      TextButton(
                        onPressed: controller.goBackToLogin,
                        child: Text(
                          zLogin,
                          style: Get.textTheme.labelLarge
                              ?.copyWith(color: Get.theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
