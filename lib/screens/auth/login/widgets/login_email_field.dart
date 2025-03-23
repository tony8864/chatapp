import 'package:chatapp/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/simple_text_field.dart';
import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleTextField(
      labelValue: 'Email',
      hintTextValue: 'Enter your email',
      controller: context.loginFormData.emailController,
    );
  }
}
