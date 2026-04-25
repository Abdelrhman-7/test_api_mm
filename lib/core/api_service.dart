import 'package:dio/dio.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://clinicbook.runasp.net/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post('Account/Login', data: request.toJson());

      if (response.data is Map<String, dynamic>) {
        return LoginResponse.fromJson(response.data);
      } else if (response.statusCode == 200) {
        return LoginResponse(status: true, message: 'Login Successful');
      } else {
        return LoginResponse(
          status: false,
          message: 'Unexpected response format',
        );
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        return LoginResponse.fromJson(e.response!.data);
      } else {
        return LoginResponse(
          status: false,
          message: e.message ?? 'Connection Error',
        );
      }
    } catch (e) {
      return LoginResponse(status: false, message: e.toString());
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        'Account/Register',
        data: request.toJson(),
      );

      return RegisterResponse(status: true, message: response.data.toString());
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is List) {
        final errorMessage = data
            .map((error) => error['description'].toString())
            .join('\n');

        return RegisterResponse(status: false, message: errorMessage);
      }

      return RegisterResponse(
        status: false,
        message: e.message ?? 'Connection Error',
      );
    }
  }
}
