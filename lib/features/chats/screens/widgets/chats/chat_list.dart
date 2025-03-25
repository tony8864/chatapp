import 'package:flutter/material.dart';
import 'chat_tile.dart';

class ChatList extends StatelessWidget {
  final List<Map<String, dynamic>> chats;

  const ChatList({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ChatTile(
          name: chat['name'],
          lastMessage: chat['lastMessage'],
          time: chat['time'],
          hasUnread: chat['hasUnread'],
        );
      },
      separatorBuilder: (context, index) => const Divider(indent: 16, endIndent: 16),
    );
  }
}
