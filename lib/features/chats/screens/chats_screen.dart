import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(title: 'Chats'),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            const SizedBox(height: 24),
            //Expanded(child: ChatList(chats: fakeChats)),
            const Spacer(),
            BottomNavBar(appPage: AppPage.chats),
          ],
        ),
      ),
    );
  }
}
