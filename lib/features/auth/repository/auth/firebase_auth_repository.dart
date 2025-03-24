// import 'dart:developer';

import 'dart:developer';

import 'package:chatapp/core/exceptions/auth_exception.dart';
import 'package:chatapp/features/auth/models/login_model.dart';
import 'package:chatapp/features/auth/models/register_model.dart';
import 'package:chatapp/features/auth/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> login(LoginModel loginModel) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailAddressException();
      } else if (e.code == 'wrong-password' ||
          e.code == 'user-not-found' ||
          e.code == 'invalid-credential') {
        throw InvalidCredentialsException();
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<String?> register(RegisterModel registerModel) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAddressException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordExcetpion();
      }
    } catch (e) {
      log('wtf happend: $e');
      throw Exception('Failed to register user.');
    }
    return null;
  }
}
