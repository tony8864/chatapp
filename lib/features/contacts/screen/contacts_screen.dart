import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/features/contacts/screen/widgets/contacts_list_stream_builder.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(title: 'Contacts'),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            ContactsListStreamBuilder(),
            const Spacer(),
            BottomNavBar(appPage: AppPage.contacts),
          ],
        ),
      ),
    );
  }
}
