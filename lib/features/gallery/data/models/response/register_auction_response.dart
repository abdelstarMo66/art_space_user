import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_auction_response.g.dart';

@JsonSerializable()
class RegisterAuctionResponse {
  final String message, status;
  final int code;
  final Data data;

  const RegisterAuctionResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory RegisterAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAuctionResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String url;

  const Data({
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}
