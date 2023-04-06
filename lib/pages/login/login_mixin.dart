import 'package:flutter/cupertino.dart';
import 'package:forms/pages/login/login_page.dart';

mixin LoginMixin on State<LoginPage> {
  String? emailValidator(String? text) {
    text ??= ''; //es lo mismo que text = text ?? '';
    final isValid = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(text);

    if (isValid) {
      return null;
    }

    return 'Invalid email address';
  }

  String? passwordValidator(String? text) {
    text ??= '';
    text = text.replaceAll(' ', '');
    if (text.length >= 8) {
      return null;
    }

    return 'Invalid password';
  }

  // String? checkboxValidator(bool? value) {
  //   if (value == true) {
  //     return null;
  //   }

  //   return 'Chekbox required';
  // }
}
