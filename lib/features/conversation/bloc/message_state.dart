part of 'message_bloc.dart';

enum MessageStateStatus { initial, loading, success, failure }

class MessageState extends Equatable {
  final MessageStateStatus status;
  final String errorMsg;

  const MessageState({this.status = MessageStateStatus.initial, this.errorMsg = ''});

  MessageState copyWith({MessageStateStatus? status, String? errorMsg}) {
    return MessageState(errorMsg: errorMsg ?? this.errorMsg, status: status ?? this.status);
  }

  @override
  List<Object> get props => [status, errorMsg];
}
