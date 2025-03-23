import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  final double lineThickness;
  final Color lineColor;
  final double spacing;
  final double horizontalMargin;

  const DividerWithText({
    super.key,
    required this.text,
    this.lineThickness = 1.0,
    this.lineColor = Colors.grey,
    this.spacing = 10.0,
    this.horizontalMargin = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: lineThickness,
              color: lineColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Text(
              text,
              style: GoogleFonts.merriweatherSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: lineThickness,
              color: lineColor,
            ),
          ),
        ],
      ),
    );
  }
}
