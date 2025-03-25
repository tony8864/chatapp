import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/chats/bloc/chat_bloc.dart';
import 'package:chatapp/features/chats/screens/conversation_screen.dart';
import 'package:chatapp/features/contacts/bloc/contacts_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

enum _ContactsMenuAction { removeContact, chat }

class ContactsPopMenu extends StatelessWidget {
  final AppUser contact;

  const ContactsPopMenu({super.key, required this.contact});

  void _onMenuItemSelected(BuildContext context, _ContactsMenuAction action) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final chatId = _generateChatId(currentUserId, contact.uid);
    switch (action) {
      case _ContactsMenuAction.removeContact:
        context.read<ContactsBloc>().add(RemoveContactEvent(contact.uid));
        return;
      case _ContactsMenuAction.chat:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => BlocProvider.value(
                  value: BlocProvider.of<ChatBloc>(context),
                  child: ConversationScreen(
                    userName: '${contact.firstname} ${contact.lastname}',
                    userInitial: contact.firstname[0],
                    chatId: chatId,
                    senderId: currentUserId,
                  ),
                ),
          ),
        );
        return;
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return ids.join('_');
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => _onMenuItemSelected(context, value),
      itemBuilder: (context) => [_removeContact(), _chatWithContact()],
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
          Text('Remove', style: GoogleFonts.merriweatherSans(fontSize: 14)),
        ],
      ),
    );
  }

  PopupMenuEntry<_ContactsMenuAction> _chatWithContact() {
    return PopupMenuItem(
      value: _ContactsMenuAction.chat,
      child: Row(
        children: [
          Icon(Icons.message_outlined),
          SizedBox(width: 8),
          Text('Chat', style: GoogleFonts.merriweatherSans(fontSize: 14)),
        ],
      ),
    );
  }
}
