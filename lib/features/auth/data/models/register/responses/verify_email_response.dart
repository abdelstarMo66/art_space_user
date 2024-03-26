import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_response.g.dart';

@JsonSerializable()
class VerifyEmailResponse {
  final String message, status;
  final int code;
  final Data data;

  VerifyEmailResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String token;

  const Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
