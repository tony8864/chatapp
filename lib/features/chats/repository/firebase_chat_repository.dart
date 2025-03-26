import 'package:chatapp/features/chats/model/chat_thread.dart';
import 'package:chatapp/features/chats/model/participant.dart';
import 'package:chatapp/features/chats/repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatRepository implements ChatRepository {
  final _store = FirebaseFirestore.instance;

  @override
  Future<String> createChatThread(String user1Id, String user2Id) async {
    final chatId = _generateChatId(user1Id, user2Id);
    try {
      final threadRef = _store.collection('chats').doc(chatId);

      final snapshot = await threadRef.get();

      if (snapshot.exists) return chatId;

      List<String> userIds = [user1Id, user2Id];
      List<String> usernames = await Future.wait(userIds.map((id) => _getUserName(id)));

      final thread = ChatThread(
        id: chatId,
        participants: [
          Participant(id: user1Id, name: usernames[0]),
          Participant(id: user2Id, name: usernames[1]),
        ],
        lastMessage: '',
        lastUpdated: DateTime.now(),
      );

      await threadRef.set(thread.toMap());
    } catch (e) {
      throw Exception('Failed to create chat thread.');
    }
    return chatId;
  }

  Future<String> _getUserName(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        String firstName = data['firstname'] ?? '';
        String lastName = data['lastname'] ?? '';
        return '$firstName $lastName'.trim();
      } else {
        return 'Unknown User';
      }
    } catch (e) {
      throw Exception('Failed to get user name.');
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return ids.join('_');
  }
}
