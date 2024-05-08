import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_card_order_response.g.dart';

@JsonSerializable()
class CreateCardOrderResponse {
  final String message, status;
  final int code;
  final Data data;

  const CreateCardOrderResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory CreateCardOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCardOrderResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String url;

  const Data({required this.url});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
