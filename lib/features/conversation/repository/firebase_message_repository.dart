import 'package:chatapp/features/conversation/model/message.dart';
import 'package:chatapp/features/conversation/repository/message_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMessageRepository implements MessageRepository {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> sendMessage(String chatId, String content) async {
    try {
      final messageRef = _store.collection('chats').doc(chatId).collection('messages');

      final message = Message(
        senderId: (_auth.currentUser?.uid)!,
        content: content,
        timestamp: DateTime.now(),
      );

      final messageDoc = messageRef.doc();

      await messageDoc.set(message.toMap());

      await _store.collection('chats').doc(chatId).update({
        'lastMessage': content,
        'lastUpdated': DateTime.now(),
      });
    } catch (e) {
      throw Exception('Failed to send message.');
    }
  }
}
