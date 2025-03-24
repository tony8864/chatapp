part of 'register_form_bloc.dart';

enum RegisterFormStatus { initial, success, emptyFieldError }

class RegisterFormState extends Equatable {
  final bool isPasswordVisible;
  final RegisterFormStatus status;
  final String errorMsg;

  const RegisterFormState({
    this.isPasswordVisible = false,
    this.status = RegisterFormStatus.initial,
    this.errorMsg = '',
  });

  RegisterFormState copyWith({
    bool? isPasswordVisible,
    RegisterFormStatus? status,
    String? errorMsg,
  }) {
    return RegisterFormState(
      errorMsg: errorMsg ?? this.errorMsg,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object?> get props => [isPasswordVisible, status, errorMsg];
}
