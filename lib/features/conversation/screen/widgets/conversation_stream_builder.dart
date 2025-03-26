import 'package:chatapp/features/conversation/model/message.dart';
import 'package:chatapp/features/conversation/screen/widgets/conversation_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationStreamBuilder extends StatelessWidget {
  final String chatId;

  const ConversationStreamBuilder({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection('chats')
                .doc(chatId)
                .collection('messages')
                .orderBy('timestamp', descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Failed to load messages'));
          } else {
            final docs = snapshot.data?.docs ?? [];

            if (docs.isEmpty) {
              return Center(child: Text('No messages found'));
            }

            final messages =
                docs.map((doc) {
                  final data = doc.data();
                  return Message.fromMap(data);
                }).toList();

            return ConversationList(messages: messages);
          }
        },
      ),
    );
  }
}
