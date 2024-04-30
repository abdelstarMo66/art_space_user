import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_response.g.dart';

@JsonSerializable()
class ArtistResponse {
  final String message, status;
  final int code;
  final Data data;

  const ArtistResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory ArtistResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtistResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final Artist artist;
  @JsonKey(name: "products")
  final List<Artwork> artworks;
  @JsonKey(name: "events")
  final List<Exhibition> exhibitions;
  final List<Auction> auctions;

  const Data({
    required this.artist,
    required this.artworks,
    required this.exhibitions,
    required this.auctions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Artist {
  final String id, name, email, profileImg, phone;
  final String? bio;

  const Artist({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.profileImg,
    required this.phone,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@JsonSerializable()
class Artwork {
  final String id, title, category;
  final int price;
  final bool isAvailable, inEvent;
  final CoverImage coverImage;

  const Artwork({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.isAvailable,
    required this.inEvent,
    required this.coverImage,
  });

  factory Artwork.fromJson(Map<String, dynamic> json) =>
      _$ArtworkFromJson(json);
}

@JsonSerializable()
class Exhibition {
  final String id, title, began, end;
  final int duration;
  final String coverImage;

  const Exhibition({
    required this.id,
    required this.title,
    required this.began,
    required this.end,
    required this.duration,
    required this.coverImage,
  });

  factory Exhibition.fromJson(Map<String, dynamic> json) =>
      _$ExhibitionFromJson(json);
}

@JsonSerializable()
class Auction {
  final String id, began, end;
  final int duration;
  final CoverImage coverImage;
  final bool isAvailable;

  const Auction({
    required this.id,
    required this.began,
    required this.end,
    required this.duration,
    required this.coverImage,
    required this.isAvailable,
  });

  factory Auction.fromJson(Map<String, dynamic> json) =>
      _$AuctionFromJson(json);
}

@JsonSerializable()
class CoverImage {
  final String image;

  const CoverImage({required this.image});

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);
}
