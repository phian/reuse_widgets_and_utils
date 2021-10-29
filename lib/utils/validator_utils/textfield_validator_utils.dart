import 'package:e_commerce_app_widgets/utils/extensions/extensions.dart';

class TextFieldValidatorUtils {
  static String? validateEmail(String? value) {
    if (value == null) {
      return 'Email is not valid!';
    } else {
      if (value.isEmpty) {
        return 'Email is not valid!';
      }
    }

    var result = value.isEmail();
    if (result) {
      return null;
    } else {
      return 'Email is not valid!';
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return 'Phone is not valid!';
    } else {
      if (value.isEmpty) {
        return 'Phone is not valid!';
      }
    }

    var result = value.isPhoneNumber();
    if (result) {
      return null;
    } else {
      return 'Phone is not valid!';
    }
  }

  static String? validateName(String? value) {
    if (value == null) {
      return 'Name is not valid!';
    } else {
      if (value.isEmpty) {
        return 'Name is not valid!';
      }
    }
  }

  static String? validatePassword(String? value) {
    if (value == null) {
      return 'Password is not valid!';
    } else {
      if (value.isEmpty) {
        return 'Password is not valid!';
      }
    }
  }
}
