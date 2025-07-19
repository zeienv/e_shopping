import 'package:dio/dio.dart';
import '../../domain/entity/auth_entity.dart';
import '../model/auth_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio}) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (obj) => print(obj),
    ));
  }

  @override
  Future<AuthModel> register(AuthEntity user) async {
    try {
      final response = await dio.post(
        'https://api.escuelajs.co/api/v1/users',
        data: AuthModel(
          email: user.email,
          name: user.name,
          password: user.password,
          role: user.role,
          avatar: user.avatar,
        ).toJson(),
      );

      return AuthModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        data: {'email': email, 'password': password},
      );

      // Assume successful login returns user info or token.
      return AuthModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        'Login failed:  ${e.response?.data['message'] ?? e.message}',
      );
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
