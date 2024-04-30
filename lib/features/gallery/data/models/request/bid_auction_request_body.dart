import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid_auction_request_body.g.dart';

@JsonSerializable()
class BidAuctionRequestBody {
  final num finalPrice;

  BidAuctionRequestBody({required this.finalPrice});

  Map<String, dynamic> toJson() => _$BidAuctionRequestBodyToJson(this);
}
