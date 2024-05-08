import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_card_order_request_body.g.dart';

@JsonSerializable()
class CreateCardOrderRequestBody {
  final String shippingAddress;

  const CreateCardOrderRequestBody({
    required this.shippingAddress,
  });

  Map<String, dynamic> toJson() => _$CreateCardOrderRequestBodyToJson(this);
}
