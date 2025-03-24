import 'package:chatapp/features/auth/bloc/register_form_bloc/register_form_bloc.dart';
import 'package:chatapp/shared/widgets/auth_loading_indicator.dart';
import 'package:chatapp/features/auth/screens/register/widgets/form/register_to_login_text.dart';
import 'package:chatapp/features/auth/screens/register/widgets/text_fields/register_email_field.dart';
import 'package:chatapp/features/auth/screens/register/widgets/text_fields/register_full_name_field.dart';
import 'package:chatapp/features/auth/screens/register/widgets/text_fields/register_password_field.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:chatapp/shared/buttons/app_button.dart';
import 'package:chatapp/shared/buttons/google_button.dart';
import 'package:chatapp/shared/widgets/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormContent extends StatelessWidget {
  const RegisterFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(flex: 1),
          RegisterEmailField(),
          const Spacer(flex: 1),
          RegisterFullNameField(),
          const Spacer(flex: 1),
          RegisterPasswordField(),
          AuthLoadingIndicator(),
          const Spacer(flex: 1),
          _registerButton(context),
          const SizedBox(height: 12),
          DividerWithText(text: 'or'),
          const SizedBox(height: 12),
          _registerWithGoogle(),
          const Spacer(flex: 2),
          RegisterToLoginText(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return AppButton(
      text: 'Register',
      callback: () {
        final email = context.registerFormData.email;
        final firstname = context.registerFormData.firstname;
        final lastname = context.registerFormData.lastname;
        final password = context.registerFormData.password;

        context.read<RegisterFormBloc>().add(
          RegisterFormValidationEvent(
            email: email,
            password: password,
            firstname: firstname,
            lastname: lastname,
          ),
        );
      },
    );
  }

  Widget _registerWithGoogle() {
    return GoogleButton(text: 'Sign up with Google');
  }
}
