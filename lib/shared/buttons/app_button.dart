import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const AppButton({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text, style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
