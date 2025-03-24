import 'package:chatapp/features/auth/screens/login/login_form_data.dart';
import 'package:chatapp/features/auth/screens/register/register_form_data.dart';
import 'package:flutter/material.dart';

extension LoginFormDataExtension on BuildContext {
  LoginFormData get loginFormData {
    final data = LoginFormData.of(this);
    assert(data != null, 'LoginFormData not found in widget tree.');
    return data!;
  }

  RegisterFormData get registerFormData {
    final data = RegisterFormData.of(this);
    assert(data != null, 'RegisterFormData not found in widget tree.');
    return data!;
  }
}
