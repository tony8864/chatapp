import 'package:bloc/bloc.dart';
import 'package:chatapp/features/conversation/repository/message_repository.dart';
import 'package:equatable/equatable.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;

  MessageBloc({required this.messageRepository}) : super(MessageState()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<MessageState> emit) async {
    try {
      await messageRepository.sendMessage(event.chatId, event.content);
    } catch (e) {
      emit(state.copyWith(status: MessageStateStatus.failure, errorMsg: 'Failed to send message.'));
    }
  }
}
