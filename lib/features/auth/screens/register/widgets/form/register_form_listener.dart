import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/bloc/register_form_bloc/register_form_bloc.dart';
import 'package:chatapp/features/auth/screens/register/widgets/form/register_form_content.dart';
import 'package:chatapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormListener extends StatelessWidget {
  const RegisterFormListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterFormBloc, RegisterFormState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == RegisterFormStatus.emptyFieldError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg, style: GoogleFonts.merriweatherSans(fontSize: 13)),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state.status == RegisterFormStatus.success) {
          String email = context.registerFormData.email;
          String firstname = context.registerFormData.firstname;
          String lastname = context.registerFormData.lastname;
          String password = context.registerFormData.password;

          GetIt.instance.get<AuthBloc>().add(
            RegisterEvent(
              email: email,
              lastname: lastname,
              firstname: firstname,
              password: password,
            ),
          );
        }
      },
      child: RegisterFormContent(),
    );
  }
}
