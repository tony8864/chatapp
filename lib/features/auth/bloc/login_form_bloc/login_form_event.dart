part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginPasswordVisibilityChangeEvent extends LoginFormEvent {}

class LoginFormValidationEvent extends LoginFormEvent {
  final String email;
  final String password;

  LoginFormValidationEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
