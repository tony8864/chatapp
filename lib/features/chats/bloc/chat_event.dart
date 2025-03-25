part of 'chat_bloc.dart';

sealed class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String chatId;
  final String senderId;
  final String content;

  SendMessageEvent({
    required this.chatId,
    required this.senderId,
    required this.content,
  });
}
