import 'package:chatapp/routes/app_navigator.dart';
import 'package:chatapp/screens/app/chats/widgets/chat_list.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> fakeChats = [
    {
      'name': 'Alice Johnson',
      'lastMessage': 'Hey, are you free tomorrow?',
      'time': '2:30 PM',
      'hasUnread': true,
    },
    {'name': 'Bob Smith', 'lastMessage': 'See you soon!', 'time': 'Yesterday', 'hasUnread': false},
    {
      'name': 'Charlie Lee',
      'lastMessage': '', // No message yet
      'time': '',
      'hasUnread': false,
    },
    {
      'name': 'Diana Prince',
      'lastMessage': '', // No message yet
      'time': '',
      'hasUnread': false,
    },
    {
      'name': 'Ethan Hunt',
      'lastMessage': 'Let me check and get back to you.',
      'time': 'Monday',
      'hasUnread': true,
    },
  ];

  ChatsScreen({super.key});

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
            Expanded(child: ChatList(chats: fakeChats)),
            BottomNavBar(appPage: AppPage.chats),
          ],
        ),
      ),
    );
  }
}
