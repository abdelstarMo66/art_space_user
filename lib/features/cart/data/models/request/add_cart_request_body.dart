import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_request_body.g.dart';

@JsonSerializable()
class AddCartRequestBody {
  final String productId;

  const AddCartRequestBody({required this.productId});

  Map<String, dynamic> toJson() => _$AddCartRequestBodyToJson(this);
}
