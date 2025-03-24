import 'package:chatapp/features/auth/bloc/register_form_bloc/register_form_bloc.dart';
import 'package:chatapp/features/auth/screens/register/widgets/text_fields/register_password_error_field.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPasswordField extends StatelessWidget {
  const RegisterPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PasswordTextField(
              labelValue: 'Password',
              hintTextValue: 'Enter strong password',
              controller: context.registerFormData.passwordController,
              icon: state.isPasswordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () {
                context.read<RegisterFormBloc>().add(RegisterPasswordVisibilityChangeEvent());
              },
              obscureText: !state.isPasswordVisible,
            ),
            const SizedBox(height: 4),
            RegisterPasswordErrorField(),
          ],
        );
      },
    );
  }
}
