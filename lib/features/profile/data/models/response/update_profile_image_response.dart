import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_image_response.g.dart';

@JsonSerializable()
class UpdateProfileImageResponse {
  final String message, status;
  final int code;

  const UpdateProfileImageResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory UpdateProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileImageResponseFromJson(json);
}
