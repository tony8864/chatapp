import 'package:chatapp/features/auth/screens/login/login_form_data.dart';
import 'package:chatapp/features/auth/screens/login/widgets/form/login_form_listener.dart';
import 'package:flutter/material.dart';

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
      child: Form(key: _formKey, child: LoginFormListener()),
    );
  }
}

