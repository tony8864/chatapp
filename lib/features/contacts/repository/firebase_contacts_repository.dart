import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'contacts_repository.dart';

class FirebaseContactsRepository implements ContactsRepository {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  @override
  Future<void> removeContact(String contactUid) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('User not logged in');

    await _store.collection('users').doc(uid).collection('contacts').doc(contactUid).delete();
  }
}
