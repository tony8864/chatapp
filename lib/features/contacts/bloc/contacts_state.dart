part of 'contacts_bloc.dart';

enum ContactsStateStatus { initial, loading, success, failure }

class ContactsState extends Equatable {
  final ContactsStateStatus status;
  final String errorMsg;

  const ContactsState({this.status = ContactsStateStatus.initial, this.errorMsg = ''});

  ContactsState copyWith({ContactsStateStatus? status, String? errorMsg}) {
    return ContactsState(status: status ?? this.status, errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object> get props => [status];
}
