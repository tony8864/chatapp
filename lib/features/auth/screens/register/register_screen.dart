import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/screens/register/widgets/form/register_form.dart';
import 'package:chatapp/shared/scaffolds/auth_scaffold.dart';
import 'package:chatapp/shared/widgets/chat_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(InitializeAuthPageEvent());
  }

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
