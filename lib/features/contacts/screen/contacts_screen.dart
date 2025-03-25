import 'package:chatapp/core/routes/app_navigator.dart';
import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/contacts/screen/widgets/contact_list.dart';
import 'package:chatapp/shared/widgets/bottom_nav_bar.dart';
import 'package:chatapp/shared/widgets/screen_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ScreenTitle(title: 'Contacts'),
            Divider(color: const Color.fromARGB(255, 195, 195, 195)),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .collection('contacts')
                        .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Failed to load contacts.'));
                  } else {
                    final docs = snapshot.data?.docs ?? [];

                    if (docs.isEmpty) {
                      return Center(child: Text('No contacts found.'));
                    }

                    final users =
                        docs.map((doc) {
                          final data = doc.data();
                          return AppUser.fromMap(data, doc.id);
                        }).toList();
                    return ContactList(users: users);
                  }
                },
              ),
            ),
            const Spacer(),
            BottomNavBar(appPage: AppPage.contacts),
          ],
        ),
      ),
    );
  }
}
