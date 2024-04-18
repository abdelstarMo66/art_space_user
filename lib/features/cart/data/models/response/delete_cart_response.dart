import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_cart_response.g.dart';

@JsonSerializable()
class DeleteCartResponse {
  final String message, status;
  final int code;

  DeleteCartResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartResponseFromJson(json);
}
