import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String labelValue;
  final String hintTextValue;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? width;

  const AppTextField({
    super.key,
    required this.labelValue,
    required this.hintTextValue,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_label(), const SizedBox(height: 4), _field()],
      ),
    );
  }

  Widget _label() {
    return Text(
      labelValue,
      style: GoogleFonts.merriweatherSans(
        fontSize: 14,
        color: Color.fromARGB(255, 9, 9, 9),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _field() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha: 0.2),
        //     blurRadius: 10,
        //     offset: const Offset(4, 4),
        //   ),
        // ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 243, 243, 243),
            
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hintTextValue,
              hintStyle: GoogleFonts.merriweatherSans(fontSize: 15),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
