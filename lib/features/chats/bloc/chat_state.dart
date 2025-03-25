part of 'chat_bloc.dart';

enum ChatStateStatus { initial, loading, success, failure }

class ChatState extends Equatable {
  final ChatStateStatus status;
  final List<Message> messages;
  final String errorMsg;

  const ChatState({
    this.status = ChatStateStatus.initial,
    this.messages = const [],
    this.errorMsg = '',
  });

  ChatState copyWith({ChatStateStatus? status, List<Message>? messages, String? errorMsg}) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object> get props => [];
}
