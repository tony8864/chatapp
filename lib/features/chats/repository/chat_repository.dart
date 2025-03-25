abstract class ChatRepository {
  Future<void> createChatThread(String user1Id, String user2Id);
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  });
}
