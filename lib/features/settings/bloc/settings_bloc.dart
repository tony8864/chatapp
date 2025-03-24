import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<LogoutEvent>(_onLogout);
  }

  void _onLogout(LogoutEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStateStatus.loggingOut));
    await FirebaseAuth.instance.signOut();
    emit(state.copyWith(status: SettingsStateStatus.loggedOut));
  }
}
