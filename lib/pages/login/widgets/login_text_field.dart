import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTextField extends FormField<String> {
  LoginTextField(
      {Key? key,
      void Function(String)? onChanged,
      String? Function(String?)? validator,
      required String label,
      TextInputType? keyboardType,
      TextInputAction? textInputAction,
      void Function(String)? onSubmitted,
      bool obscureText = false})
      : super(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: key,
          builder: (state) {
            bool isOk = !state.hasError &&
                state.value != null &&
                state.value!.isNotEmpty;
            return TextField(
              textInputAction: textInputAction,
              obscureText: obscureText,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              onChanged: (text) {
                state.didChange(text);
                if (onChanged != null) {
                  onChanged(text);
                }
              },
              decoration: InputDecoration(
                  label: Text(label),
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: isOk ? Colors.green : Colors.black12,
                  )),
            );
          },
        );
}
