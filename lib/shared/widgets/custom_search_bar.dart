import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final VoidCallback onClearChanged;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.onClearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: const Color.fromARGB(255, 200, 200, 200)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color.fromARGB(255, 200, 200, 200)),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon:
              controller.text.isNotEmpty
                  ? IconButton(icon: const Icon(Icons.close), onPressed: onClearChanged)
                  : null,
        ),
      ),
    );
  }
}
