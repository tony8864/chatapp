import 'package:chatapp/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/password_text_field.dart';
import 'package:flutter/material.dart';

class RegisterConfirmPasswordField extends StatelessWidget {
  const RegisterConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      labelValue: 'Confirm Password',
      hintTextValue: 'Retype your password',
      controller: context.registerFormData.confirmPasswordController,
      obscureText: true,
    );
  }
}
