import 'package:chatapp/features/auth/models/app_user.dart';

class RegisterModel {
  final String email;
  final String firstname;
  final String lastname;
  final String password;

  const RegisterModel({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,
  });

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      password: map['password'],
    );
  }

  AppUser toUser(String uid) {
    return AppUser(uid: uid, firstname: firstname, lastname: lastname);
  }
}
