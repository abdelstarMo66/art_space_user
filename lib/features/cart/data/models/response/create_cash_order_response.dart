import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_cash_order_response.g.dart';

@JsonSerializable()
class CreateCashOrderResponse {
  final String message, status;
  final int code;

  const CreateCashOrderResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory CreateCashOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCashOrderResponseFromJson(json);
}
