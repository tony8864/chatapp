import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc() : super(RegisterFormState()) {
    on<RegisterPasswordVisibilityChangeEvent>(_onChangePasswordVisibility);
    on<RegisterFormValidationEvent>(_onFormValidation);
  }

  void _onChangePasswordVisibility(
    RegisterPasswordVisibilityChangeEvent event,
    Emitter<RegisterFormState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onFormValidation(RegisterFormValidationEvent event, Emitter<RegisterFormState> emit) async {
    bool isAnyFieldEmpty =
        event.email.isEmpty ||
        event.password.isEmpty ||
        event.firstname.isEmpty ||
        event.lastname.isEmpty;

    if (isAnyFieldEmpty) {
      emit(
        state.copyWith(
          status: RegisterFormStatus.emptyFieldError,
          errorMsg: 'You cannot leave empty fields.',
        ),
      );
      await Future.delayed(Duration.zero);
      emit(state.copyWith(status: RegisterFormStatus.initial, errorMsg: ''));
    } else {
      emit(state.copyWith(status: RegisterFormStatus.success));
      await Future.delayed(Duration.zero);
      emit(state.copyWith(status: RegisterFormStatus.initial, errorMsg: ''));
    }
  }
}
