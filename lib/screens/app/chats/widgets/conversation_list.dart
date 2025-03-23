import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  final List<Map<String, String>> messages;

  const ConversationList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      reverse: true, 
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index];
        final isMe = message['sender'] == 'me';

        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message['text'] ?? '',
              style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}
