part of 'contacts_bloc.dart';

sealed class ContactsEvent {}

class RemoveContactEvent extends ContactsEvent {
  final String uid;
  RemoveContactEvent(this.uid);
}
