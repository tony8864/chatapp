import 'package:bloc/bloc.dart';
import 'package:chatapp/features/contacts/repository/contacts_repository.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsRepository contactsRepository;

  ContactsBloc({required this.contactsRepository}) : super(ContactsState()) {
    on<RemoveContactEvent>(_onRemoveContact);
  }

  Future<void> _onRemoveContact(RemoveContactEvent event, Emitter<ContactsState> emit) async {
    try {
      emit(state.copyWith(status: ContactsStateStatus.loading));
      await contactsRepository.removeContact(event.uid);
      emit(state.copyWith(status: ContactsStateStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: ContactsStateStatus.failure, errorMsg: 'Failed to remove contact.'),
      );
    }
  }
}
