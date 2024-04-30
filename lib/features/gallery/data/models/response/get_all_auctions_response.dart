import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_auctions_response.g.dart';

@JsonSerializable()
class GetAllAuctionsResponse {
  final String status, message;
  final int code;
  final Data data;

  const GetAllAuctionsResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory GetAllAuctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllAuctionsResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final List<Auction> auctions;

  const Data({required this.auctions});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Auction {
  final String id, title, description, began, category;
  final num price;
  final int duration;
  final bool isAvailable, isLaunch, isEnded;
  final Artist artist;
  final ProductImage coverImage;

  const Auction({
    required this.id,
    required this.title,
    required this.description,
    required this.began,
    required this.category,
    required this.price,
    required this.duration,
    required this.isAvailable,
    required this.isLaunch,
    required this.isEnded,
    required this.artist,
    required this.coverImage,
  });

  factory Auction.fromJson(Map<String, dynamic> json) =>
      _$AuctionFromJson(json);
}

@JsonSerializable()
class Artist {
  final String id, name;

  const Artist({required this.id, required this.name});

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@JsonSerializable()
class ProductImage {
  final String image;

  const ProductImage({required this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);
}
