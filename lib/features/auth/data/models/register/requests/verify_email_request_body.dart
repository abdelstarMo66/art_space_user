import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_request_body.g.dart';

@JsonSerializable()
class VerifyEmailRequestBody {
  final String email, activateCode;

  const VerifyEmailRequestBody({
    required this.email,
    required this.activateCode,
  });

  Map<String, dynamic> toJson() => _$VerifyEmailRequestBodyToJson(this);
}
