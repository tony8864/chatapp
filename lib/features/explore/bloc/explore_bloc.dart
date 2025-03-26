import 'package:bloc/bloc.dart';
import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/chats/repository/chat_repository.dart';
import 'package:chatapp/features/contacts/model/contact.dart';
import 'package:chatapp/features/contacts/repository/contacts_repository.dart';
import 'package:chatapp/features/explore/repository/explore_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreRepository exploreRepository;
  final ChatRepository chatRepository;
  final ContactsRepository contactsRepository;

  ExploreBloc({
    required this.exploreRepository,
    required this.chatRepository,
    required this.contactsRepository,
  }) : super(ExploreState()) {
    on<SearchUsersEvent>(_onSearchUsers);
    on<AddContactEvent>(_onAddContact);
  }

  Future<void> _onAddContact(AddContactEvent event, Emitter<ExploreState> emit) async {
    try {
      String chatId = await chatRepository.createChatThread(
        event.user.uid,
        (FirebaseAuth.instance.currentUser?.uid)!,
      );
      final contact = Contact.fromMap({...event.user.toMap(), 'chatId': chatId}, event.user.uid);
      await contactsRepository.addContact(contact);
      final updatedResults = List<AppUser>.from(state.results)
        ..removeWhere((user) => user.uid == event.user.uid);
      emit(state.copyWith(results: updatedResults, status: ExploreStateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ExploreStateStatus.failure, errorMsg: 'Failed to add contact'));
    }
  }

  Future<void> _onSearchUsers(SearchUsersEvent event, Emitter<ExploreState> emit) async {
    if (event.query.trim().isEmpty) {
      emit(state.copyWith(status: ExploreStateStatus.initial));
      return;
    }

    emit(state.copyWith(status: ExploreStateStatus.loading, query: event.query));

    try {
      final users = await exploreRepository.searchUsers(event.query);
      emit(state.copyWith(status: ExploreStateStatus.success, results: users));
    } catch (e) {
      emit(
        state.copyWith(
          status: ExploreStateStatus.failure,
          errorMsg: 'Error searching when searching users.',
        ),
      );
    }
  }
}
