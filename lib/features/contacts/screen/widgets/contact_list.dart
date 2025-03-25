import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/contacts/screen/widgets/contacts_pop_menu.dart';
import 'package:chatapp/shared/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<AppUser> users;

  const ContactList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final fullname = '${users[index].firstname} ${users[index].lastname}';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: UserTile(name: fullname, trailing: ContactsPopMenu(contact: users[index])),
        );
      },
      separatorBuilder:
          (context, index) => const Divider(
            color: Color.fromARGB(255, 220, 220, 220),
            height: 0,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
    );
  }
}
