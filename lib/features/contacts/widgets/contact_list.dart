import 'package:chatapp/shared/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<String> names;

  const ContactList({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: UserTile(name: names[index]),
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
