import 'package:chatapp/features/chats/model/chat_thread.dart';
import 'package:chatapp/features/chats/model/message.dart';
import 'package:chatapp/features/chats/repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatRepository implements ChatRepository {
  final _store = FirebaseFirestore.instance;

  @override
  Future<void> createChatThread(String user1Id, String user2Id) async {
    try {
      final chatId = _generateChatId(user1Id, user2Id);

      final threadRef = _store.collection('chats').doc(chatId);

      final snapshot = await threadRef.get();

      if (snapshot.exists) return;

      final thread = ChatThread(
        id: chatId,
        participants: [user1Id, user2Id],
        lastMessage: '',
        lastUpdated: DateTime.now(),
      );

      await threadRef.set(thread.toMap());
    } catch (e) {
      throw Exception('Failed to create chat thread.');
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return ids.join('_');
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    final messageRef = _store.collection('chats').doc(chatId).collection('messages');
    final newMessage = Message(
      id: '',
      senderId: senderId,
      content: content,
      timestamp: DateTime.now(),
    );
    final messageDoc = messageRef.doc();
    await messageDoc.set(newMessage.toMap());

    await _store.collection('chats').doc(chatId).update({
      'lastMessage': content,
      'lastUpdated': Timestamp.fromDate(DateTime.now()),
    });
  }
}
