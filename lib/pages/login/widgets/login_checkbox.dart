import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginCheckbox extends FormField<bool> {
  LoginCheckbox({
    Key? key,
    required void Function(bool value) onChanged,
    bool? initialValue,
    AutovalidateMode? autovalidateMode,
    String? Function(bool?)? validator,
  }) : super(
            key: key,
            autovalidateMode: autovalidateMode,
            initialValue: initialValue,
            validator: validator,
            builder: (state) {
              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        title: Text('Hello wordld'),
                        value: state.value ?? false,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          if (value != null) {
                            state.didChange(value);
                            onChanged(value);
                          }
                        },
                      ),
                      if (state.hasError)
                        Text(
                          state.errorText!,
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  )
                ],
              );
            });
}
