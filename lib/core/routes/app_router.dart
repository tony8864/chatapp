import 'package:chatapp/features/auth/bloc/login_form_bloc/login_form_bloc.dart';
import 'package:chatapp/features/auth/bloc/register_form_bloc/register_form_bloc.dart';
import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/features/chats/chats_screen.dart';
import 'package:chatapp/features/chats/conversation_screen.dart';
import 'package:chatapp/features/contacts/contacts_screen.dart';
import 'package:chatapp/features/explore/bloc/explore_bloc.dart';
import 'package:chatapp/features/explore/repository/firebase_explore_repository.dart';
import 'package:chatapp/features/explore/screens/explore_screen.dart';
import 'package:chatapp/features/auth/screens/login/login_screen.dart';
import 'package:chatapp/features/auth/screens/register/register_screen.dart';
import 'package:chatapp/features/settings/bloc/settings_bloc.dart';
import 'package:chatapp/features/settings/screens/settings_screen.dart';
import 'package:chatapp/features/auth/screens/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRouter(bool isAuthenticated) {
    return GoRouter(
      initialLocation: isAuthenticated ? '/home/contacts' : '/auth',
      navigatorKey: navigatorKey,
      routes: [
        _authRoutes(),
        GoRoute(path: '/home/contacts', builder: (context, state) => const ContactsScreen()),
        GoRoute(path: '/home/chats', builder: (context, state) => ChatsScreen()),
        GoRoute(
          path: '/home/settings',
          builder:
              (context, state) => BlocProvider<SettingsBloc>(
                create: (context) => SettingsBloc(),
                child: const SettingsScreen(),
              ),
        ),
        GoRoute(
          path: '/home/explore',
          builder: (context, state) {
            final exploreRepository = FirebaseExploreRepository();
            return BlocProvider<ExploreBloc>(
              create: (context) => ExploreBloc(exploreRepository: exploreRepository),
              child: const ExploreScren(),
            );
          },
        ),
        GoRoute(
          path: '/home/chats/test',
          builder: (context, state) {
            final List<Map<String, String>> fakeMessages = [
              {'sender': 'me', 'text': 'Hey1!'},
              {'sender': 'them', 'text': 'Hello'},
              {'sender': 'me', 'text': 'How are you doing?'},
              {'sender': 'them', 'text': 'All good, you?'},
              {'sender': 'me', 'text': 'Hey!'},
              {'sender': 'them', 'text': 'Hello'},
              {'sender': 'me', 'text': 'How are you doing?'},
              {'sender': 'them', 'text': 'All good, you?'},
              {'sender': 'me', 'text': 'Hey!'},
              {'sender': 'them', 'text': 'Hello'},
              {'sender': 'me', 'text': 'How are you doing?'},
              {'sender': 'them', 'text': 'All good, you?'},
              {'sender': 'me', 'text': 'Hey!'},
              {'sender': 'them', 'text': 'Hello'},
              {'sender': 'me', 'text': 'How are you doing?'},
              {'sender': 'them', 'text': 'All good, you?'},
            ];

            return ConversationScreen(userName: 'Alice', userInitial: 'A', messages: fakeMessages);
          },
        ),
      ],
    );
  }

  static GoRoute _authRoutes() {
    return GoRoute(
      path: '/auth',
      builder: (context, state) => const WelcomeScreen(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) {
            return BlocProvider<LoginFormBloc>(
              create: (context) => LoginFormBloc(),
              child: LoginScreen(),
            );
          },
        ),
        GoRoute(
          path: 'register',
          builder: (context, state) {
            return BlocProvider<RegisterFormBloc>(
              create: (_) => RegisterFormBloc(),
              child: RegisterScreen(),
            );
          },
        ),
      ],
    );
  }
}
