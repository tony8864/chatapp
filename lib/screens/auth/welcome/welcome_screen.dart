import 'package:chatapp/routes/app_navigator.dart';
import 'package:chatapp/shared/buttons/app_button.dart';
import 'package:chatapp/shared/scaffolds/auth_scaffold.dart';
import 'package:chatapp/shared/widgets/chat_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(flex: 1),
            ChatLogo(),
            const SizedBox(height: 24),
            _welcomeText(),
            const Spacer(flex: 3),
            _getStartedButton(context),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return Text('Start messaging in seconds.', style: GoogleFonts.merriweatherSans(fontSize: 24));
  }

  Widget _getStartedButton(BuildContext context) {
    return AppButton(
      text: 'Get started',
      callback: () {
        AppNavigator.go('/auth/register');
      },
    );
  }
}
