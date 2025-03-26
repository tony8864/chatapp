import 'package:chatapp/features/chats/model/chat_thread.dart';
import 'package:chatapp/features/chats/screens/widgets/chat_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatListStreamBuilder extends StatelessWidget {
  const ChatListStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUid = FirebaseAuth.instance.currentUser?.uid;
    return Expanded(
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection('chats')
                .where('participantIds', arrayContains: currentUid!)
                .where('lastMessage', isNotEqualTo: '')
                .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Failed to load chats'));
          } else {
            final docs = snapshot.data?.docs ?? [];

            if (docs.isEmpty) {
              return Center(child: Text('No chats found'));
            }

            final chats =
                docs.map((doc) {
                  final data = doc.data();
                  return ChatThread.fromMap(data, doc.id);
                }).toList();

            return ChatList(chats: chats);
          }
        },
      ),
    );
  }
}
