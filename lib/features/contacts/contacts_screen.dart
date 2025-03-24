import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/features/contacts/widgets/contact_list.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fakeContacts = [
      'Alice Johnson',
      'Bob Smith',
      'Charlie Lee',
      'Diana Prince',
      'Ethan Hunt',
      'Fiona Adams',
      'George Brown',
      'Alice Johnson',
      'Bob Smith',
      'Charlie Lee',
      'Diana Prince',
      'Ethan Hunt',
      'Fiona Adams',
      'George Brown',
      'Alice Johnson',
      'Bob Smith',
      'Charlie Lee',
      'Diana Prince',
      'Ethan Hunt',
      'Fiona Adams',
      'George Brown',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(title: 'Contacts'),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            Expanded(child: ContactList(names: fakeContacts)),
            BottomNavBar(appPage: AppPage.contacts),
          ],
        ),
      ),
    );
  }
}
