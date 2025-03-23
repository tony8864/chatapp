import 'package:chatapp/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/simple_text_field.dart';
import 'package:flutter/material.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleTextField(
      labelValue: 'Password',
      hintTextValue: 'Enter your password',
      controller: context.loginFormData.passwordController,
    );
  }
}
