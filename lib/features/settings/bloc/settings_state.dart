part of 'settings_bloc.dart';

enum SettingsStateStatus { initial, loggingOut, loggedOut }

class SettingsState extends Equatable {
  final SettingsStateStatus status;

  const SettingsState({this.status = SettingsStateStatus.initial});

  SettingsState copyWith({SettingsStateStatus? status}) {
    return SettingsState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
