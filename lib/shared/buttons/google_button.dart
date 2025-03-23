import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleButton extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final double iconSize;
  final String text;

  const GoogleButton({
    super.key,
    this.height = 24,
    this.backgroundColor = Colors.white,
    this.iconSize = 24,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              width: 24,
              height: 24,
              filterQuality: FilterQuality.none,
            ),
            const SizedBox(width: 12),
            Text(text, style: GoogleFonts.merriweather(color: Colors.black, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
