class AuthEntity {
  final String email;
  final String name;
  final String password;
  final String role;
  final String avatar;

  const AuthEntity({
    required this.email,
    required this.name,
    required this.password,
    required this.role,
    required this.avatar,
  });
}
