import 'package:chatapp/features/auth/models/app_user.dart';
import 'package:chatapp/features/explore/screens/widgets/explore_pop_menu.dart';
import 'package:chatapp/shared/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UserSearchResults extends StatelessWidget {
  final List<AppUser> displayedResults;

  const UserSearchResults({super.key, required this.displayedResults});

  @override
  Widget build(BuildContext context) {
    if (displayedResults.isEmpty) {
      return const Center(child: Text('No users found'));
    }

    return ListView.separated(
      itemCount: displayedResults.length,
      itemBuilder: (context, index) {
        final user = displayedResults[index];
        return UserTile(
          name: '${user.firstname} ${user.lastname}',
          trailing: ExplorePopMenu(resultUser: displayedResults[index]),
        );
      },
      separatorBuilder: (_, __) => const Divider(indent: 16, endIndent: 16),
    );
  }
}
