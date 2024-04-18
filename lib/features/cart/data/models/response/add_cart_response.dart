import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_response.g.dart';

@JsonSerializable()
class AddCartResponse {
  final String message, status;
  final int code;

  AddCartResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory AddCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCartResponseFromJson(json);
}
