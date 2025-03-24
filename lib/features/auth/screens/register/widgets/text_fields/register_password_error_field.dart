import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPasswordErrorField extends StatelessWidget {
  const RegisterPasswordErrorField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String? errorText;
        if (state.status == AuthStatus.unauthenticated) {
          if (state.unauthenticatedStatus == UnauthenticatedStatus.weakPassword) {
            errorText = 'Please choose a stronger password';
          }
        }

        if (errorText != null) {
          return Text(
            errorText,
            style: GoogleFonts.merriweatherSans(fontSize: 13, color: Colors.red),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
