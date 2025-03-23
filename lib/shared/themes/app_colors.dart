import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 0, 157, 220);
  static const Color accent = Color(0xFF00BFA6);
  static const Color background = Color(0xFFF8F8FA);
  static const Color textPrimary = Color(0xFF32325D);

  static LinearGradient get mainGradient => LinearGradient(
    colors: [
      primary,
      accent.withValues(alpha: .6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
