import 'package:chatapp/routes/app_navigator.dart';
import 'package:chatapp/screens/auth/register/register_form_data.dart';
import 'package:chatapp/screens/auth/register/widgets/register_email_field.dart';
import 'package:chatapp/screens/auth/register/widgets/register_full_name_field.dart';
import 'package:chatapp/screens/auth/register/widgets/register_password_field.dart';
import 'package:chatapp/screens/auth/register/widgets/register_to_login_text.dart';
import 'package:chatapp/shared/buttons/app_button.dart';
import 'package:chatapp/shared/buttons/google_button.dart';
import 'package:chatapp/shared/divider_with_text.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterFormWidgetState();
  }
}

class _RegisterFormWidgetState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterFormData(
      firstNameController: _firstNameController,
      lastNameController: _lastNameController,
      emailController: _emailController,
      confirmPasswordController: _confirmPasswordController,
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
        children: [
          const Spacer(flex: 1,),
          RegisterEmailField(),
          const Spacer(flex: 1,),
          RegisterFullNameField(),
          const Spacer(flex: 1,),
          RegisterPasswordField(),
          const Spacer(flex: 1,),
          _registerButton(),
          const SizedBox(height: 12),
          DividerWithText(text: 'or'),
          const SizedBox(height: 12),
          _registerWithGoogle(),
          const Spacer(flex: 2,),
          RegisterToLoginText(),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return AppButton(text: 'Register', callback: () {
      AppNavigator.go('/home/contacts');
    });
  }

  Widget _registerWithGoogle() {
    return GoogleButton(text: 'Sign up with Google');
  }
}
