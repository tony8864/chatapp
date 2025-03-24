import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/screens/login/widgets/form/login_form.dart';
import 'package:chatapp/shared/scaffolds/auth_scaffold.dart';
import 'package:chatapp/shared/widgets/chat_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(InitializeAuthPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [const ChatLogo(), LoginForm()]),
      ),
    );
  }
}
