import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_code_response.g.dart';

@JsonSerializable()
class ResendCodeResponse {
  final String message, status;
  final int code;

  const ResendCodeResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory ResendCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendCodeResponseFromJson(json);
}
