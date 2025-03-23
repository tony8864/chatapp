import 'package:chatapp/routes/app_navigator.dart';
import 'package:chatapp/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final AppPage appPage;

  const BottomNavBar({super.key, required this.appPage});

  Color iconColor(AppPage page) {
    return appPage == page ? AppColors.primary : const Color.fromARGB(255, 131, 131, 131);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 132, 132, 132),
            offset: Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _peopleIconButton(),
          _exploreIconButton(),
          _chatBubbleIconButton(),
          _settingsIconButton(),
        ],
      ),
    );
  }

  Widget _peopleIconButton() {
    return IconButton(
      onPressed: () {
        AppNavigator.go('/home/contacts');
      },
      icon: Icon(Icons.people, color: iconColor(AppPage.contacts)),
    );
  }

  Widget _chatBubbleIconButton() {
    return IconButton(
      onPressed: () {
        AppNavigator.go('/home/chats');
      },
      icon: Icon(Icons.chat_bubble, color: iconColor(AppPage.chats)),
    );
  }

  Widget _settingsIconButton() {
    return IconButton(
      onPressed: () {
        AppNavigator.go('/home/settings');
      },
      icon: Icon(Icons.settings, color: iconColor(AppPage.settings)),
    );
  }

  Widget _exploreIconButton() {
    return IconButton(
      onPressed: () {
        AppNavigator.go('/home/explore');
      },
      icon: Icon(Icons.search, color: iconColor(AppPage.explore)),
    );
  }
}
