import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  final String message, status;
  final int code;

  const ForgetPasswordResponse({
    required this.message,
    required this.code,
    required this.status,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}
