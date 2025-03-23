import 'package:chatapp/screens/auth/login/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UserSearchResults extends StatelessWidget {
  final bool isSearching;
  final List<String> displayedResults;

  const UserSearchResults({super.key, required this.isSearching, required this.displayedResults});

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return const Padding(padding: EdgeInsets.only(top: 24), child: CircularProgressIndicator());
    } else if (displayedResults.isEmpty) {
      return const Expanded(child: Center(child: Text('No users found')));
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: displayedResults.length,
          separatorBuilder: (context, index) => const Divider(indent: 16, endIndent: 16),
          itemBuilder: (context, index) {
            final user = displayedResults[index];
            return UserTile(name: user);
          },
        ),
      );
    }
  }
}
