import 'package:flutter/services.dart';

class TextFieldValidator {
  TextFieldValidator();
  static List<TextInputFormatter> mobileNumberValidator = [
    LengthLimitingTextInputFormatter(10),
    FilteringTextInputFormatter.deny(' '),
    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
  ];
  static List<TextInputFormatter> nameValidator = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
  ];
  
   String? validateMobile(
    String value,
  ) {
    String pattern = r'[6-9]{1}[0-9]{9}';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Enter Mobile Number';
    } else if (value.length == 10 && !regExp.hasMatch(value)) {
      return 'Enter valid Mobile Number';
    }
    return null;
  }
}
