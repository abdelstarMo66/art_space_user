import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_code_request_body.g.dart';

@JsonSerializable()
class ResendCodeRequestBody {
  final String email;

  const ResendCodeRequestBody({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$ResendCodeRequestBodyToJson(this);
}
