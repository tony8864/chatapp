import 'package:chatapp/screens/auth/register/widgets/register_form.dart';
import 'package:chatapp/shared/scaffolds/auth_scaffold.dart';
import 'package:chatapp/shared/widgets/chat_logo.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [const ChatLogo(), RegisterForm()]),
        ),
      ),
    );
  }
}
