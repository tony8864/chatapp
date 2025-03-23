import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SettingLogout extends StatelessWidget {
  final VoidCallback onTap;

  const SettingLogout({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: AppColors.primary),
      title: const Text(
        'Log out',
        style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios, size: 24, color: AppColors.primary),
        onPressed: onTap,
      ),
      onTap: null,
    );
  }
}
