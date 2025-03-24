part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEvent extends AuthEvent {
  final String email;
  final String firstname;
  final String lastname;
  final String password;

  const RegisterEvent({
    required this.email,
    required this.lastname,
    required this.firstname,
    required this.password,
  });

  @override
  List<Object> get props => [email, firstname, lastname, password];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

final class InitializeAuthPageEvent extends AuthEvent {}