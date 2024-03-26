import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_response.g.dart';

@JsonSerializable()
class VerifyCodeResponse {
  final String message, status;
  final int code;

  const VerifyCodeResponse({
    required this.message,
    required this.code,
    required this.status,
  });

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}
