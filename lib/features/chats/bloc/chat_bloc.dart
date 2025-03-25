import 'package:bloc/bloc.dart';
import 'package:chatapp/features/chats/model/message.dart';
import 'package:chatapp/features/chats/repository/chat_repository.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({required this.chatRepository}) : super(ChatState()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    try {
      await chatRepository.sendMessage(
        chatId: event.chatId,
        senderId: event.senderId,
        content: event.content,
      );
    } catch (e) {
      emit(state.copyWith(status: ChatStateStatus.failure, errorMsg: 'Failed to send message.'));
    }
  }
}
