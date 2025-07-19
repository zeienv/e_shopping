import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/auth_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUserUseCase registerUserUseCase;

  AuthBloc({required this.registerUserUseCase}) : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await registerUserUseCase(event.user);
        emit(AuthSuccess(user));
      } on DioException catch (e) {
        String message = 'Registration failed. Please try again.';
        if (e.response?.statusCode == 400) {
          final errorData = e.response?.data;
          if (errorData is Map && errorData['message'] != null) {
            message = errorData['message'];
          } else {
            message = 'Invalid input. Please check your details.';
          }
        }
        emit(AuthError(message));
      } catch (e) {
        emit(AuthError('Something went wrong. Please try again.'));
      }
    });
  }
}
