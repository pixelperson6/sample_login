import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sample_login/app/core/values/text_strings.dart';

import '../../../core/utils/validators.dart';
import '../../../core/values/image_strings.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
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
        title: const Text(zLogin),
        centerTitle: true,
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ZImageAssets.screenBg), fit: BoxFit.fill),
          ),
          height: Get.height - 68,
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
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
                    child: Text(zLoginTitle,
                        style: Get.textTheme.headlineLarge!
                            .copyWith(color: Get.theme.primaryColor)),
                  ),
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
                  Text(
                    zEmail,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => TextFormField(
                        controller: controller.username.value,
                        validator: ZValidator.emailValidator,
                        focusNode: controller.usernameFocus,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (term) {
                          controller.usernameFocus.unfocus();
                          FocusScope.of(context)
                              .requestFocus(controller.passwordFocus);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          prefixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 14,
                            color: Get.theme.primaryColor.withOpacity(0.25),
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
                   zPassword,
                    style: Get.textTheme.labelLarge,
                  ),
                  SizedBox(height: 5.h),
                  Obx(() => TextFormField(
                        controller: controller.password,
                        obscureText: controller.obscurePassword.value,
                        validator: ZValidator.passwordValidator,
                        focusNode: controller.passwordFocus,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          controller.login();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (value) {
                                  controller.rememberMe.value = value!;
                                },
                              )),
                          Text(
                            zRememberMe,
                            style: Get.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: controller.forgetPassword,
                        child: const Text(
                          zForgotPassword,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ElevatedButton(
                        onPressed: controller.login,
                        child: const Text(zLogin)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(zNoAccountQuestion,
                          style: Get.textTheme.labelLarge),
                      TextButton(
                        onPressed: controller.goToRegister,
                        child: Text(
                          zSignup,
                          style: Get.textTheme.labelLarge
                              ?.copyWith(color: Get.theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Center(
                      child: Text(zOrSignInWith,
                          style: Get.textTheme.titleMedium)),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.HOME),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.theme.colorScheme.outline
                                    .withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            ZImageAssets.fb,
                            height: 25.0,
                            width: 25.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.HOME),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.theme.colorScheme.outline
                                    .withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            ZImageAssets.google,
                            height: 25.0,
                            width: 25.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.HOME),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.theme.colorScheme.outline
                                    .withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            ZImageAssets.apple,
                            height: 25.0,
                            width: 25.0,
                          ),
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
