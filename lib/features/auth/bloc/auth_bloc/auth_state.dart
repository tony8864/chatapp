part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated }

enum UnauthenticatedStatus { initial, weakPassword, badEmailFormat, emailAlreadyInUse, invalidCredentials, undefined }

class AuthState extends Equatable {
  final AuthStatus status;
  final UnauthenticatedStatus? unauthenticatedStatus;

  const AuthState({this.status = AuthStatus.initial, this.unauthenticatedStatus});

  AuthState copyWith({AuthStatus? status, UnauthenticatedStatus? unauthenticatedStatus}) {
    return AuthState(
      status: status ?? this.status,
      unauthenticatedStatus: unauthenticatedStatus ?? this.unauthenticatedStatus,
    );
  }

  @override
  List<Object?> get props => [status, unauthenticatedStatus];
}
