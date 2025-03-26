import 'package:chatapp/features/contacts/model/contact.dart';

abstract class ContactsRepository {
  Future<void> addContact(Contact contact);
  Future<void> removeContact(String contactUid);
}
