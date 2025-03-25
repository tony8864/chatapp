import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/contacts/bloc/contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

enum _ContactsMenuAction { removeContact }

class ContactsPopMenu extends StatelessWidget {
  final AppUser contact;

  const ContactsPopMenu({super.key, required this.contact});

  void _onMenuItemSelected(BuildContext context, _ContactsMenuAction action) {
    switch (action) {
      case _ContactsMenuAction.removeContact:
        context.read<ContactsBloc>().add(RemoveContactEvent(contact.uid));
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => _onMenuItemSelected(context, value),
      itemBuilder: (context) => [_removeContact()],
      icon: const Icon(Icons.more_vert),
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: Offset(0, 40),
      elevation: 8,
    );
  }

  PopupMenuEntry<_ContactsMenuAction> _removeContact() {
    return PopupMenuItem(
      value: _ContactsMenuAction.removeContact,
      child: Row(
        children: [
          Icon(Icons.person_remove),
          SizedBox(width: 8),
          Text('Remove Contact', style: GoogleFonts.merriweatherSans(fontSize: 14)),
        ],
      ),
    );
  }
}
