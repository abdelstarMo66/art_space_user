import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse {
  final String message, status;
  final int code;

  const UpdateProfileResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}
