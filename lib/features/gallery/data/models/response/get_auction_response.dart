import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_auction_response.g.dart';

@JsonSerializable()
class GetAuctionResponse {
  final String status, message;
  final int code;
  final Data data;

  const GetAuctionResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory GetAuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAuctionResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id,
      title,
      description,
      began,
      category,
      style,
      subject,
      size,
      end;
  final String? material;
  final num price;
  final int duration;
  final bool isAvailable, isLaunch, isEnded, userRegisteredInThisAuction;
  final Artist artist;
  final ProductImage coverImage;
  final List<ProductImage> images;
  final List<LastPrice> lastPrices;

  const Data({
    required this.id,
    required this.title,
    required this.description,
    required this.began,
    required this.category,
    required this.style,
    required this.subject,
    required this.size,
    required this.end,
    required this.material,
    required this.price,
    required this.duration,
    required this.isAvailable,
    required this.isLaunch,
    required this.isEnded,
    required this.userRegisteredInThisAuction,
    required this.artist,
    required this.coverImage,
    required this.images,
    required this.lastPrices,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Artist {
  final String id, name, profileImg;

  const Artist({
    required this.id,
    required this.name,
    required this.profileImg,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@JsonSerializable()
class ProductImage {
  final String image;

  const ProductImage({required this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}

@JsonSerializable()
class LastPrice {
  final User user;
  final num price;

  const LastPrice({required this.user, required this.price});

  factory LastPrice.fromJson(Map<String, dynamic> json) =>
      _$LastPriceFromJson(json);
}

@JsonSerializable()
class User {
  final String id, name;

  const User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
