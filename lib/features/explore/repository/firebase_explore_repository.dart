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

    final currentUid = FirebaseAuth.instance.currentUser?.uid;

    final snapshot =
        await _store
            .collection('users')
            .where('keywords', arrayContains: query.toLowerCase())
            .get();

    final users =
        snapshot.docs
            .map((doc) => AppUser.fromMap(doc.data(), doc.id))
            .where((user) => user.uid != currentUid)
            .toList();

    return users;
  }
}
