import '../entity/auth_entity.dart';
import '../repository/auth_repo.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<AuthEntity> call(AuthEntity user) async {
    return await repository.registerUser(user);
  }
}
