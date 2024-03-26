import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  final String message, status;
  final int code;
  final Data data;

  const ResetPasswordResponse({
    required this.message,
    required this.code,
    required this.data,
    required this.status,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String token;

  const Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
