import 'package:bloc/bloc.dart';
import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/auth/models/login_model.dart';
import 'package:chatapp/features/auth/models/register_model.dart';
import 'package:chatapp/features/auth/repository/auth/auth_repository.dart';
import 'package:chatapp/core/exceptions/auth_exception.dart';
import 'package:chatapp/features/auth/repository/user/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  AuthBloc({required this.userRepository, required this.authRepository}) : super(AuthState()) {
    on<InitializeAuthPageEvent>(_onInitializeAuthPage);
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  void _onInitializeAuthPage(InitializeAuthPageEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        status: AuthStatus.initial,
        unauthenticatedStatus: UnauthenticatedStatus.initial,
      ),
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      RegisterModel registerModel = RegisterModel(
        email: event.email,
        firstname: event.firstname,
        lastname: event.lastname,
        password: event.password,
      );

      String? uid = await authRepository.register(registerModel);
      AppUser appUser = AppUser(uid: uid!, firstname: event.firstname, lastname: event.lastname);
      await userRepository.addUser(appUser);
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      final exceptionMapping = <Type, UnauthenticatedStatus>{
        EmailAlreadyInUseException: UnauthenticatedStatus.emailAlreadyInUse,
        InvalidEmailAddressException: UnauthenticatedStatus.badEmailFormat,
        WeakPasswordExcetpion: UnauthenticatedStatus.weakPassword,
      };

      final status = exceptionMapping[e.runtimeType] ?? UnauthenticatedStatus.undefined;

      emit(state.copyWith(status: AuthStatus.unauthenticated, unauthenticatedStatus: status));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      LoginModel loginModel = LoginModel(email: event.email, password: event.password);
      await authRepository.login(loginModel);
      emit(state.copyWith(status: AuthStatus.authenticated));
    } catch (e) {
      final exceptionMapping = <Type, UnauthenticatedStatus>{
        InvalidCredentialsException: UnauthenticatedStatus.invalidCredentials,
        InvalidEmailAddressException: UnauthenticatedStatus.badEmailFormat,
      };

      final status = exceptionMapping[e.runtimeType] ?? UnauthenticatedStatus.undefined;

      emit(state.copyWith(status: AuthStatus.unauthenticated, unauthenticatedStatus: status));
    }
  }
}
