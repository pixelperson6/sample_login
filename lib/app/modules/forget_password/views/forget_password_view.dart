import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sample_login/app/core/values/text_strings.dart';

import '../../../core/utils/validators.dart';
import '../../../core/values/image_strings.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
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
          // title: const Text('Add Appointment'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.forgetPasswordKey,
            child: Container(
              height: Get.height - 80,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                    Center(
                        child: Image.asset(
                      ZImageAssets.logo,
                      height: 80.h,
                      width: 80.h,
                    )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(zForgotPassword,
                          style: Get.textTheme.headlineLarge!
                              .copyWith(color: Get.theme.primaryColor)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        zForgotText,
                        style: Get.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      zEmail,
                      style: Get.textTheme.labelLarge,
                    ),
                    SizedBox(height: 5.h),
                    TextFormField(
                      controller: controller.username,
                      validator: ZValidator.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        controller.count.value != 0
                            ? null
                            : controller.sendOTP();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.envelope,
                          size: 20,
                          color: Get.theme.primaryColor.withOpacity(0.25),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.otpSent.value,
                        child: Center(
                          child: OTPTextField(
                            length: 5,
                            width: Get.width,
                            fieldWidth: (Get.width - 50) / 5,
                            otpFieldStyle: OtpFieldStyle(
                              borderColor: Get.theme.colorScheme.outline,
                              enabledBorderColor: Get.theme.colorScheme.outline,
                              focusBorderColor: Get.theme.colorScheme.primary,
                            ),
                            style: const TextStyle(fontSize: 15),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 15,
                            onChanged: (pin) {
                              controller.otpCode.value = pin;
                            },
                            onCompleted: (otppin) async {
                              controller.otpCode.value = otppin;
                              controller.verifyOTP();
                            },
                          ),
                        ),
                      ),
                    ),
                    Obx(() => Visibility(
                          visible: controller.otpSent.value,
                          child: SizedBox(
                            height: 12.h,
                          ),
                        )),
                    Obx(
                      () => Visibility(
                        visible: controller.otpSent.value,
                        child: Center(
                          child: ElevatedButton(
                              onPressed: controller.verifyOTP,
                              child: const Text(zVerifyOtp)),
                        ),
                      ),
                    ),
                    Obx(() => Visibility(
                          visible: controller.otpSent.value,
                          child: SizedBox(
                            height: 30.h,
                          ),
                        )),
                    Obx(() => Center(
                          child: Visibility(
                            visible: controller.otpSent.value,
                            child: RichText(
                              text: TextSpan(
                                text:zOtpSent,
                                style: Get.textTheme.titleSmall!.copyWith(
                                    color: Get.theme.colorScheme.primary),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: zEmailNotReceived,
                                      style: Get.textTheme.bodyLarge!.copyWith(
                                          color: Get.theme.colorScheme.error))
                                ],
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 12.h,
                    ),
                    Obx(
                      () => Center(
                        child: ElevatedButton(
                          onPressed: controller.count.value != 0
                              ? null
                              : controller.sendOTP,
                          child: Text(controller.count.value == 0
                              ? controller.otpSent.value
                                  ? zResendOtp
                                  : zSendOtp
                              : '$zResendOtpIn ${controller.count}'),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
