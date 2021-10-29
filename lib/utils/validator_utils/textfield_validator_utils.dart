import 'package:e_commerce_app_widgets/utils/extensions/extensions.dart';

class TextFieldValidatorUtils {
  static String? validateEmail(String? value) {
    if (value == null) {
      return null;
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
      return null;
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
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value == null) {
      return null;
    }
  }
}
