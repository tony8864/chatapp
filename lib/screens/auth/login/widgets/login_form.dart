import 'package:chatapp/screens/auth/login/login_form_data.dart';
import 'package:chatapp/screens/auth/login/widgets/login_email_field.dart';
import 'package:chatapp/screens/auth/login/widgets/login_password_field.dart';
import 'package:chatapp/screens/auth/login/widgets/login_to_signup_text.dart';
import 'package:chatapp/shared/buttons/app_button.dart';
import 'package:chatapp/shared/buttons/google_button.dart';
import 'package:chatapp/shared/divider_with_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginFormWidgetState();
  }
}

class _LoginFormWidgetState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginFormData(
      emailController: _emailController,
      passwordController: _passwordController,
      child: Form(key: _formKey, child: _FormContent()),
    );
  }
}

class _FormContent extends StatelessWidget {
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
          const Spacer(flex: 2),
          _loginButton(),
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

  Widget _loginButton() {
    return AppButton(text: 'Log in', callback: () {});
  }

  Widget _loginWithGoogleButton() {
    return GoogleButton(text: 'Sign in with Google');
  }
}
