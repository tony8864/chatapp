import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/explore/bloc/explore_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

enum _ExploreMenuAction { addContact }

class ExplorePopMenu extends StatelessWidget {
  final AppUser resultUser;

  const ExplorePopMenu({super.key, required this.resultUser});

  void _onMenuItemSelected(BuildContext context, _ExploreMenuAction action) {
    switch (action) {
      case _ExploreMenuAction.addContact:
        context.read<ExploreBloc>().add(AddContactEvent(resultUser));
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => _onMenuItemSelected(context, value),
      itemBuilder: (context) => [_addContact()],
      icon: const Icon(Icons.more_vert),
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: Offset(0, 40),
      elevation: 8,
    );
  }

  PopupMenuEntry<_ExploreMenuAction> _addContact() {
    return PopupMenuItem(
      value: _ExploreMenuAction.addContact,
      child: Row(
        children: [
          Icon(Icons.person_add),
          SizedBox(width: 8),
          Text('Add Contact', style: GoogleFonts.merriweatherSans(fontSize: 14)),
        ],
      ),
    );
  }
}
