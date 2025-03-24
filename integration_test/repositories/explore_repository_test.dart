import 'package:chatapp/features/explore/repository/firebase_explore_repository.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test explore repository', () {
    late FirebaseFirestore firestore;
    late FirebaseAuth firebaseAuth;
    late FirebaseExploreRepository exploreRepository;

    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    });

    setUp(() {
      exploreRepository = FirebaseExploreRepository();
      firestore = FirebaseFirestore.instance;
      firebaseAuth = FirebaseAuth.instance;
      firestore.useFirestoreEmulator('localhost', 8080, automaticHostMapping: true);
      firebaseAuth.useAuthEmulator('localhost', 9099, automaticHostMapping: true);
    });

    group('test search users', () {
      test('searches for users using query', () async {
        final docRef = firestore.collection('users').doc('test_user');
        await docRef.set({
          'uid': 'test_user',
          'firstname': 'Alice',
          'lastname': 'Wonderland',
          'keywords': ['a', 'al', 'ali', 'alice'],
        });

        final result = await exploreRepository.searchUsers('ali');

        // Assert
        expect(result.any((u) => u.firstname == 'Alice'), true);

        // Cleanup
        await docRef.delete();
      });
    });
  });
}
