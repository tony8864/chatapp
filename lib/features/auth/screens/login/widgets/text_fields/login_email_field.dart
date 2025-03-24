import 'package:chatapp/features/auth/screens/login/widgets/text_fields/login_email_error_field.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/simple_text_field.dart';
import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleTextField(
          labelValue: 'Email',
          hintTextValue: 'Enter your email',
          controller: context.loginFormData.emailController,
        ),
        const SizedBox(height: 4),
        LoginEmailErrorField(),
      ],
    );
  }
}
