import 'package:chatapp/screens/auth/login/widgets/login_form.dart';
import 'package:chatapp/shared/scaffolds/auth_scaffold.dart';
import 'package:chatapp/shared/widgets/chat_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [const ChatLogo(), LoginForm()])
      ),
    );
  }
}
