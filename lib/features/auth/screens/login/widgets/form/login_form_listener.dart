import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/bloc/login_form_bloc/login_form_bloc.dart';
import 'package:chatapp/features/auth/screens/login/widgets/form/login_form_content.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormListener extends StatelessWidget {
  const LoginFormListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginFormBloc, LoginFormState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginFormStatus.emptyFieldError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg, style: GoogleFonts.merriweatherSans(fontSize: 13)),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state.status == LoginFormStatus.success) {
          String email = context.loginFormData.email;
          String password = context.loginFormData.password;

          GetIt.instance.get<AuthBloc>().add(LoginEvent(email: email, password: password));
        }
      },
      child: LoginFormContent(),
    );
  }
}
