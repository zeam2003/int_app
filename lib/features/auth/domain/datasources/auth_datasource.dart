import 'package:int_app/features/auth/domain/domain.dart';

abstract class AuthDataSource {
  Future<User> login(String username, String password);
  Future<User> checkAuthStatus(String token);
}