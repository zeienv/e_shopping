import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthEntity> registerUser(AuthEntity user) async {
    final model = await remoteDataSource.register(user);
    return AuthEntity(
      email: model.email,
      name: model.name,
      password: model.password,
      role: model.role,
      avatar: model.avatar,
    );
  }

  @override
  Future<AuthEntity> loginUser(String email, String password) async {
    final model = await remoteDataSource.login(email, password);
    return AuthEntity(
      email: model.email,
      name: model.name,
      password: model.password,
      role: model.role,
      avatar: model.avatar,
    );
  }
}
