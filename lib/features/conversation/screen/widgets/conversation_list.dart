import 'package:chatapp/features/conversation/model/message.dart';
import 'package:chatapp/features/conversation/screen/widgets/conversation_message.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  final List<Message> messages;

  const ConversationList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[messages.length - 1 - index];
          return ConversationMessage(message: message);
        },
      ),
    );
  }
}
