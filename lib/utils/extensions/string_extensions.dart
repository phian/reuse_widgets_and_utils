import 'package:e_commerce_app_widgets/constants/regexes/verify_textfield_regex.dart';

extension StringExtensions on String {
  bool isEmail() {
    return RegExp(VerifyTextFieldRegex.emailPattern).hasMatch(this);
  }

  bool isPhoneNumber() {
    return RegExp(VerifyTextFieldRegex.phoneNumberPattern).hasMatch(this);
  }
}