import 'package:chatapp/features/auth/models/app_user.dart';

abstract class ExploreRepository {
  Future<List<AppUser>> searchUsers(String query);
  Future<void> addContact(AppUser contact);
}
