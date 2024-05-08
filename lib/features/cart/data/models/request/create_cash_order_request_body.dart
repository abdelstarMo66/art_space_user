import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_cash_order_request_body.g.dart';

@JsonSerializable()
class CreateCashOrderRequestBody {
  final String shippingAddress;

  const CreateCashOrderRequestBody({
    required this.shippingAddress,
  });

  Map<String, dynamic> toJson() => _$CreateCashOrderRequestBodyToJson(this);
}
