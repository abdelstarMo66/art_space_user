import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  final String message, status;
  final int code;
  final Data data;

  const ChangePasswordResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String token;

  const Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
