import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid_auction_response.g.dart';

@JsonSerializable()
class BidAuctionResponse {
  final String message, status;
  final int code;

  BidAuctionResponse(this.message, this.status, this.code);

  factory BidAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$BidAuctionResponseFromJson(json);
}
