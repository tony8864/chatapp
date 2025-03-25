import 'package:chatapp/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/repository/auth/firebase_auth_repository.dart';
import 'package:chatapp/features/auth/repository/user/firebase_user_repository.dart';
import 'package:chatapp/features/chats/repository/firebase_chat_repository.dart';
import 'package:chatapp/features/explore/repository/firebase_explore_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FirebaseChatRepository>(() => FirebaseChatRepository());
  getIt.registerLazySingleton<FirebaseUserRepository>(() => FirebaseUserRepository());
  getIt.registerLazySingleton<FirebaseAuthRepository>(() => FirebaseAuthRepository());
  getIt.registerLazySingleton<FirebaseExploreRepository>(() => FirebaseExploreRepository());
  getIt.registerLazySingleton<AuthBloc>(() {
    final userRepository = getIt.get<FirebaseUserRepository>();
    final authRepository = getIt.get<FirebaseAuthRepository>();
    return AuthBloc(userRepository: userRepository, authRepository: authRepository);
  });
}
