part of 'login_form_bloc.dart';

enum LoginFormStatus { initial, success, emptyFieldError }

class LoginFormState extends Equatable {
  final bool isPasswordVisible;
  final LoginFormStatus status;
  final String errorMsg;

  const LoginFormState({
    this.isPasswordVisible = false,
    this.status = LoginFormStatus.initial,
    this.errorMsg = '',
  });

  LoginFormState copyWith({bool? isPasswordVisible, LoginFormStatus? status, String? errorMsg}) {
    return LoginFormState(
      errorMsg: errorMsg ?? this.errorMsg,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible, status, errorMsg];
}
