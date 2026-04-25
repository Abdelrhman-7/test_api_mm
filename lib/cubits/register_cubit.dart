import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/register_model.dart';
import '../core/api_service.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String? message;
  RegisterSuccess(this.message);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}

class RegisterCubit extends Cubit<RegisterState> {
  final ApiService _apiService;

  RegisterCubit(this._apiService) : super(RegisterInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());

    try {
      // Using the injected _apiService to avoid unused field warning
      final result = await _apiService.register(request);

      // result.status is bool?, so we need == true
      if (result.status == true) {
        emit(RegisterSuccess(result.message));
      } else {
        // result.message is String?, RegisterError expects non-null String
        emit(RegisterError(result.message ?? 'Registration failed'));
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
