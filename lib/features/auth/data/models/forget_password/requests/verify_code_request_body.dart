import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_request_body.g.dart';

@JsonSerializable()
class VerifyCodeRequestBody {
  final String email, resetCode;

  const VerifyCodeRequestBody({required this.email, required this.resetCode});

  Map<String, dynamic> toJson() => _$VerifyCodeRequestBodyToJson(this);
}
