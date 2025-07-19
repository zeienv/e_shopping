import '../entity/auth_entity.dart';
import '../repository/auth_repo.dart';

class LoginUserUseCase {
  final AuthRepository repository;

  LoginUserUseCase(this.repository);

  Future<AuthEntity> call(String email, String password) async {
    return await repository.loginUser(email, password);
  }
}
