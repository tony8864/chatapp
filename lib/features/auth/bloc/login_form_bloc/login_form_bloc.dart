import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(LoginFormState()) {
    on<LoginPasswordVisibilityChangeEvent>(_onChangePasswordVisibility);
    on<LoginFormValidationEvent>(_onFormValidation);
  }

  void _onChangePasswordVisibility(
    LoginPasswordVisibilityChangeEvent event,
    Emitter<LoginFormState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onFormValidation(LoginFormValidationEvent event, Emitter<LoginFormState> emit) async {
    bool isAnyFieldEmpty = event.email.isEmpty || event.password.isEmpty;

    if (isAnyFieldEmpty) {
      emit(
        state.copyWith(
          status: LoginFormStatus.emptyFieldError,
          errorMsg: 'You cannot leave empty fields.',
        ),
      );
      await Future.delayed(Duration.zero);
      emit(state.copyWith(status: LoginFormStatus.initial, errorMsg: ''));
    } else {
      emit(state.copyWith(status: LoginFormStatus.success));
      await Future.delayed(Duration.zero);
      emit(state.copyWith(status: LoginFormStatus.initial, errorMsg: ''));
    }
  }
}
