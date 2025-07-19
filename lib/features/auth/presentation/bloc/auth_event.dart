import 'package:equatable/equatable.dart';
import '../../domain/entity/auth_entity.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends AuthEvent {
  final AuthEntity user;

  const RegisterUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}
