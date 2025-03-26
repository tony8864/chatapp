import 'package:chatapp/features/conversation/bloc/message_bloc.dart';
import 'package:chatapp/features/conversation/repository/firebase_message_repository.dart';
import 'package:chatapp/features/conversation/screen/conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTile extends StatelessWidget {
  final String chatId;
  final String name;
  final String lastMessage;
  final String time;

  const ChatTile({
    super.key,
    required this.chatId,
    required this.name,
    required this.lastMessage,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(name[0], style: TextStyle(color: Colors.white)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
          Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              final messageRepository = FirebaseMessageRepository();
              return BlocProvider(
                create: (context) => MessageBloc(messageRepository: messageRepository),
                child: ConversationScreen(
                  chatId: chatId,
                  userName: name,
                  userInitial: _getInitials(name),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String _getInitials(String fullName) {
    final names = fullName.trim().split(RegExp(r'\s+'));
    if (names.isEmpty) return '';

    final firstInitial = names.first.isNotEmpty ? names.first[0] : '';
    final lastInitial = names.length > 1 && names.last.isNotEmpty ? names.last[0] : '';

    return (firstInitial + lastInitial).toUpperCase();
  }
}
