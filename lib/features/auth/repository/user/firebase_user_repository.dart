import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/auth/repository/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepository implements UserRepository {
  final _store = FirebaseFirestore.instance;

  @override
  Future<void> addUser(AppUser user) async {
    try {
      await _store.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to add user');
    }
  }
}
