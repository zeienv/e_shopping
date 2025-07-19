import '../entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> registerUser(AuthEntity user);
  Future<AuthEntity> loginUser(String email, String password);
}
