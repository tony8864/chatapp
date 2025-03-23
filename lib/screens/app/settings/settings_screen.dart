import 'package:chatapp/routes/app_navigator.dart';
import 'package:chatapp/screens/app/settings/widgets/setting_logout.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(title: 'Settings'),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            const SizedBox(height: 24),
            SettingLogout(onTap: () {}),
            const Spacer(),
            BottomNavBar(appPage: AppPage.settings),
          ],
        ),
      ),
    );
  }
}
