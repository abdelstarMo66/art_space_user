import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String name, email, password, passwordConfirm, phone, gender;

  const RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
