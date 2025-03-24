import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/auth/repository/user/firebase_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test user repository', () {
    late FirebaseFirestore firestore;
    late FirebaseAuth firebaseAuth;
    late FirebaseUserRepository userRepository;

    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    });

    setUp(() {
      userRepository = FirebaseUserRepository();
      firestore = FirebaseFirestore.instance;
      firebaseAuth = FirebaseAuth.instance;
      firestore.useFirestoreEmulator('localhost', 8080, automaticHostMapping: true);
      firebaseAuth.useAuthEmulator('localhost', 9099, automaticHostMapping: true);
    });

    group('test add user', () {
      test('adds registered user', () async {
        final loggedUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: 'test@email.com',
          password: 'test123',
        );
        final uid = loggedUser.user?.uid;
        final appUser = AppUser(uid: uid!, firstname: 'Quentin', lastname: 'Tarantino');
        await userRepository.addUser(appUser);
        final snapshot = await firestore.collection('users').doc(uid).get();
        final data = snapshot.data()!;
        expect(data['firstname'], 'Quentin');
        expect(data['lastname'], 'Tarantino');
      });
    });
  });
}
