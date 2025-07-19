import 'package:e_commerce_app/features/auth/data/model/auth_model.dart';

import '../../domain/entity/auth_entity.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> register(AuthEntity user);
  Future<AuthModel> login(String email, String password);
}
