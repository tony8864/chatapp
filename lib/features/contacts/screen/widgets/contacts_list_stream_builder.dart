import 'package:chatapp/features/contacts/model/contact.dart';
import 'package:chatapp/features/contacts/screen/widgets/contact_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContactsListStreamBuilder extends StatelessWidget {
  const ContactsListStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return Expanded(
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

            final contacts =
                docs.map((doc) {
                  final data = doc.data();
                  return Contact.fromMap(data, doc.id);
                }).toList();
            return ContactList(contacts: contacts);
          }
        },
      ),
    );
  }
}
