import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_address_response.g.dart';

@JsonSerializable()
class DeleteAddressResponse {
  final String message, status;
  final int code;

  const DeleteAddressResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory DeleteAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressResponseFromJson(json);
}
