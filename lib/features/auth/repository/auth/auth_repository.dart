import 'package:chatapp/features/auth/models/login_model.dart';
import 'package:chatapp/features/auth/models/register_model.dart';

abstract class AuthRepository {
  Future<String?> register(RegisterModel registerModel);
  Future<void> login(LoginModel loginModel);
  Future<void> logout();
}
