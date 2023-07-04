import 'package:get/get.dart';

class ZValidator {
  static String? emailValidator(String? value) {
    if (!value!.isEmail) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String? stringValidator(String? value) {
    if (value!.isEmpty) {
      return 'Required*';
    } else {
      return null;
    }
  }

  static String? numberValidator(String? value) {
    if (!value!.isNumericOnly || value.length != 10) {
      return 'Enter valid number';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.length < 6) {
      return 'Password should be at least 6 character';
    } else {
      return null;
    }
  }
}
