import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTile extends StatelessWidget {
  final String name;
  final Color avatarColor;
  final Widget trailing;

  const UserTile({
    super.key,
    required this.name,
    this.avatarColor = AppColors.primary,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(name[0], style: GoogleFonts.merriweatherSans(color: Colors.white)),
      ),
      title: Text(name, style: GoogleFonts.merriweatherSans(fontSize: 14)),
      trailing: trailing,
    );
  }
}
