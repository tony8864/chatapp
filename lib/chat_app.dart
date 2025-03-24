import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/core/routes/app_router.dart';
import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ChatApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<AuthBloc>(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final isAuthenticated = snapshot.hasData;
          return MaterialApp.router(
            theme: _themeData(),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.getRouter(isAuthenticated),
          );
        },
      ),
    );
  }

  ThemeData _themeData() {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 16, 24, 32),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 254, 231, 21)),
      ),
    );
  }
}
