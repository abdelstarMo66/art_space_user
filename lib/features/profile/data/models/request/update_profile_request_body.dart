import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequestBody {
  final String name, phone;

  UpdateProfileRequestBody({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
}
