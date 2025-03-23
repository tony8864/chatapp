import 'package:chatapp/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/password_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPasswordField extends StatelessWidget {
  const RegisterPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      labelValue: 'Password',
      hintTextValue: 'Enter strong password',
      controller: context.registerFormData.passwordController,
      obscureText: true,
    );
  }
}
