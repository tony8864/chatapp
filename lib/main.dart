import 'package:chatapp/routes/app_router.dart';
import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _themeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.getRouter(),
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
