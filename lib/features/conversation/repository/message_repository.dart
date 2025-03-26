abstract class MessageRepository {
  Future<void> sendMessage(String chatId, String message);
}
