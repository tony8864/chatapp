import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/auth/repository/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepository implements UserRepository {
  final _store = FirebaseFirestore.instance;

  @override
  Future<void> addUser(AppUser user) async {
    try {
      final keywords = _generateKeywords('${user.firstname} ${user.lastname}');

      final userData = {...user.toMap(), 'keywords': keywords};
      await _store.collection('users').doc(user.uid).set(userData);
    } catch (e) {
      throw Exception('Failed to add user');
    }
  }

  List<String> _generateKeywords(String fullname) {
    final keywords = <String>[];
    final name = fullname.toLowerCase();

    for (int i = 1; i <= name.length; i++) {
      keywords.add(name.substring(0, i));
    }

    return keywords.toList();
  }
}
