abstract class ChatRepository {
  Future<String> createChatThread(String user1Id, String user2Id);
}
