import 'package:chatapp/features/chats/model/chat_thread.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chat_tile.dart';

class ChatList extends StatelessWidget {
  final List<ChatThread> chats;

  const ChatList({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return ListView.separated(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final contactName =
            chat.participants.firstWhere((participant) => participant.id != currentUserId).name;
        return ChatTile(
          chatId: chat.id,
          name: contactName,
          lastMessage: chat.lastMessage,
          time: _formatChatDate(chat.lastUpdated),
        );
      },
      separatorBuilder: (context, index) => const Divider(indent: 16, endIndent: 16),
    );
  }

  String _formatChatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      // If today, show time (e.g., 3:45 PM)
      return DateFormat.jm().format(date);
    } else if (today.difference(dateToCheck).inDays < 7) {
      // Within the past week, show weekday (e.g., Mon)
      return DateFormat.E().format(date);
    } else {
      // Older, show date (e.g., Mar 26)
      return DateFormat.MMMd().format(date);
    }
  }
}
