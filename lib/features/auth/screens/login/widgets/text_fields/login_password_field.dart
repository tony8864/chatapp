import 'package:chatapp/features/auth/bloc/login_form_bloc/login_form_bloc.dart';
import 'package:chatapp/features/auth/screens/login/widgets/text_fields/login_password_error_field.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PasswordTextField(
              labelValue: 'Password',
              hintTextValue: 'Enter your password',
              controller: context.loginFormData.passwordController,
              icon: state.isPasswordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () {
                context.read<LoginFormBloc>().add(LoginPasswordVisibilityChangeEvent());
              },
              obscureText: !state.isPasswordVisible,
            ),
            const SizedBox(height: 4),
            LoginPasswordErrorField(),
          ],
        );
      },
    );
  }
}
