import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/login_model.dart';
import '../core/api_service.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse response;
  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class LoginCubit extends Cubit<LoginState> {
  final ApiService _apiService;

  LoginCubit(this._apiService) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      final response = await _apiService.login(request);
      
      if (response.status == true) {
        emit(LoginSuccess(response));
      } else {
        emit(LoginError(response.message ?? 'Login failed'));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
