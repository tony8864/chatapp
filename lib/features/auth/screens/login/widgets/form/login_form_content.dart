import 'package:chatapp/features/auth/bloc/login_form_bloc/login_form_bloc.dart';
import 'package:chatapp/features/auth/screens/login/widgets/form/login_to_signup_text.dart';
import 'package:chatapp/features/auth/screens/login/widgets/text_fields/login_email_field.dart';
import 'package:chatapp/features/auth/screens/login/widgets/text_fields/login_password_field.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:chatapp/shared/buttons/app_button.dart';
import 'package:chatapp/shared/buttons/google_button.dart';
import 'package:chatapp/shared/widgets/divider_with_text.dart';
import 'package:chatapp/shared/widgets/auth_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormContent extends StatelessWidget {
  const LoginFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(flex: 1),
          LoginEmailField(),
          const Spacer(flex: 1),
          LoginPasswordField(),
          const SizedBox(height: 4),
          _forgotPasswordButton(),
          AuthLoadingIndicator(),
          const Spacer(flex: 2),
          _loginButton(context),
          const SizedBox(height: 12),
          DividerWithText(text: 'or'),
          const SizedBox(height: 12),
          _loginWithGoogleButton(),
          const Spacer(flex: 2),
          LoginToSignupText(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _forgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot your password?',
        style: GoogleFonts.merriweatherSans(fontSize: 14, color: Color.fromARGB(255, 60, 60, 67)),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return AppButton(
      text: 'Log in',
      callback: () {
        final email = context.loginFormData.email;
        final password = context.loginFormData.password;

        context.read<LoginFormBloc>().add(
          LoginFormValidationEvent(email: email, password: password),
        );
      },
    );
  }

  Widget _loginWithGoogleButton() {
    return GoogleButton(text: 'Sign in with Google');
  }
}
