part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessageEvent {
  final String chatId;
  final String content;

  const SendMessageEvent({required this.chatId, required this.content});
}
