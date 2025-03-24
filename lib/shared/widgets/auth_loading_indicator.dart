import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLoadingIndicator extends StatelessWidget {
  const AuthLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.loading) {
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
