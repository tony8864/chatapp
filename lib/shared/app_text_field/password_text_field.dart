import 'package:chatapp/shared/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends AppTextField {
  PasswordTextField({
    super.key,
    required super.labelValue,
    required super.hintTextValue,
    required super.controller,
    required super.obscureText,
  }) : super(suffixIcon: IconButton(icon: Icon(Icons.visibility_off), onPressed: () {}));
}
