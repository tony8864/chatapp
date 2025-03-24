import 'package:chatapp/features/auth/models/app_user.dart';

abstract class UserRepository {
  Future<void> addUser(AppUser user);
}
