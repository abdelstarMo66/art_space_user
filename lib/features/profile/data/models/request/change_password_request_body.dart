import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request_body.g.dart';

@JsonSerializable()
class ChangePasswordRequestBody {
  final String currentPassword, password, confirmPassword;

  const ChangePasswordRequestBody({
    required this.currentPassword,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);
}
