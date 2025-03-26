import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/explore/repository/explore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExploreRepository implements ExploreRepository {
  final _store = FirebaseFirestore.instance;

  @override
  Future<List<AppUser>> searchUsers(String query) async {
    if (query.isEmpty) {
      return [];
    }

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return [];
    }

    // get user's contacts
    final contactsSnapshots =
        await _store.collection('users').doc(uid).collection('contacts').get();

    final contactUids = contactsSnapshots.docs.map((doc) => doc.id).toSet();

    // search user by keywords
    final snapshot =
        await _store
            .collection('users')
            .where('keywords', arrayContains: query.toLowerCase())
            .get();

    // filter: not self, not already in contacts
    final users =
        snapshot.docs
            .map((doc) => AppUser.fromMap(doc.data(), doc.id))
            .where((user) => user.uid != uid && !contactUids.contains(user.uid))
            .toList();

    return users;
  }
}
