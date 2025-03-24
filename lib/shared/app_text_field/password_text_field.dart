import 'package:chatapp/shared/app_text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends AppTextField {

  final Widget icon;
  final VoidCallback onPressed;

  PasswordTextField({
    super.key,
    required super.labelValue,
    required super.hintTextValue,
    required super.controller,
    required super.obscureText,
    required this.icon,
    required this.onPressed,
  }) : super(suffixIcon: IconButton(icon: icon, onPressed: onPressed));
}
