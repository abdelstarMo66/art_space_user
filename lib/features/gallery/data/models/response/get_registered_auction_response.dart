import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_registered_auction_response.g.dart';

@JsonSerializable()
class GetRegisteredAuctionResponse {
  final String message, status;
  final int code;
  final Data data;

  const GetRegisteredAuctionResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetRegisteredAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRegisteredAuctionResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id;
  final List<RegisteredAuction> auctions;

  const Data({required this.id, required this.auctions});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class RegisteredAuction {
  final String auctionId, title, category, began, artistId, artistName;
  final String? profileImg, coverImage;
  final int duration;
  final num finalPrice;
  final bool isLaunch, isEnded;

  const RegisteredAuction({
    required this.auctionId,
    required this.title,
    required this.category,
    required this.began,
    required this.coverImage,
    required this.artistId,
    required this.artistName,
    required this.profileImg,
    required this.duration,
    required this.finalPrice,
    required this.isLaunch,
    required this.isEnded,
  });

  factory RegisteredAuction.fromJson(Map<String, dynamic> json) =>
      _$RegisteredAuctionFromJson(json);
}
