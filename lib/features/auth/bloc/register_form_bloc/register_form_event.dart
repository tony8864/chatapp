part of 'register_form_bloc.dart';

sealed class RegisterFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterPasswordVisibilityChangeEvent extends RegisterFormEvent {}

class RegisterFormValidationEvent extends RegisterFormEvent {
  final String email;
  final String password;
  final String firstname;
  final String lastname;

  RegisterFormValidationEvent({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  @override
  List<Object?> get props => [email, password, firstname, lastname];
}
