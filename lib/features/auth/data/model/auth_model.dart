import '../../domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required String email,
    required String name,
    required String password,
    required String role,
    required String avatar,
  }) : super(
    email: email,
    name: name,
    password: password,
    role: role,
    avatar: avatar,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'role': role,
      'avatar': avatar,
    };
  }
}
