import 'package:chatapp/features/chats/model/message.dart';
import 'package:chatapp/features/chats/screens/widgets/conversation/conversation_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationListStreamBuilder extends StatelessWidget {
  final String chatId;

  const ConversationListStreamBuilder({super.key, required this.chatId});

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
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              final docs = snapshot.data?.docs ?? [];

              if (docs.isEmpty) {
                return const Center(child: Text('Say hello'));
              }

              final messages =
                  docs.map((doc) {
                    final data = doc.data();
                    return Message.fromMap(data, doc.id);
                  }).toList();

              return ConversationList(messages: messages);
            case ConnectionState.none:
              throw UnimplementedError();
          }
        },
      ),
    );
  }
}
