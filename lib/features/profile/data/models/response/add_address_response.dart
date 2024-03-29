import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_address_response.g.dart';

@JsonSerializable()
class AddAddressResponse {
  final String message, status;
  final int code;

  const AddAddressResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAddressResponseFromJson(json);
}
