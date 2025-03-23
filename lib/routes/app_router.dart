import 'package:chatapp/routes/app_navigator.dart';
import 'package:chatapp/screens/app/chats/chats_screen.dart';
import 'package:chatapp/screens/app/chats/conversation_screen.dart';
import 'package:chatapp/screens/app/contacts/contacts_screen.dart';
import 'package:chatapp/screens/app/explore/explore_screen.dart';
import 'package:chatapp/screens/auth/login/login_screen.dart';
import 'package:chatapp/screens/auth/register/register_screen.dart';
import 'package:chatapp/screens/app/settings/settings_screen.dart';
import 'package:chatapp/screens/auth/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: '/auth',
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/auth',
          builder: (context, state) => const WelcomeScreen(),
          routes: [
            GoRoute(path: 'login', builder: (context, state) => const LoginScreen()),
            GoRoute(path: 'register', builder: (context, state) => RegisterScreen()),
          ],
        ),
        GoRoute(path: '/home/contacts', builder: (context, state) => const ContactsScreen()),
        GoRoute(path: '/home/chats', builder: (context, state) => ChatsScreen()),
        GoRoute(path: '/home/settings', builder: (context, state) => const SettingsScreen()),
        GoRoute(path: '/home/explore', builder: (context, state) => const ExploreScren()),
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
}
