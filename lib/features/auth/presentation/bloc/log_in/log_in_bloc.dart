import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/log_in_usecase.dart';
import 'log_in_event.dart';
import 'log_in_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;

  LoginBloc({required this.loginUserUseCase}) : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginUserUseCase(event.email, event.password);
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginFailure('Login failed:  ${e.toString()}'));
      }
    });
  }
}
