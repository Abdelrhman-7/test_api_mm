import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final bool? status;
  final String? message;
  final LoginData? data;

  LoginResponse({this.status, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class LoginData {
  final String? token;
  final String? email;
  final String? fullName;

  LoginData({this.token, this.email, this.fullName});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
}
