import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String fullName;
  final String email;
  final String password;

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final bool? status;
  final String? message;

  RegisterResponse({this.status, this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
