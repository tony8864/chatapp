import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterToLoginText extends StatelessWidget {
  const RegisterToLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_simpleText(), const SizedBox(width: 12), _signUpButton(context)],
      ),
    );
  }

  Widget _simpleText() {
    return Text('Already have an account?', style: GoogleFonts.merriweather(fontSize: 16));
  }

  Widget _signUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.go('/auth/login');
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        child: Text(
          'Sign in',
          style: GoogleFonts.merriweatherSans(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
