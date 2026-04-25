// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  token: json['token'] as String?,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'token': instance.token,
  'email': instance.email,
  'fullName': instance.fullName,
};
