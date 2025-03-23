import 'package:flutter/material.dart';

class RegisterFormData extends InheritedWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterFormData({
    super.key,
    required super.child,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  static RegisterFormData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RegisterFormData>();
  }

  @override
  bool updateShouldNotify(RegisterFormData oldWidget) {
    return false;
  }
}
