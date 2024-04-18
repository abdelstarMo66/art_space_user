import 'package:json_annotation/json_annotation.dart';

part 'get_all_artwork_response.g.dart';

@JsonSerializable()
class GetAllArtworksResponse {
  final String status, message;
  final int code;
  final Data data;

  GetAllArtworksResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetAllArtworksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllArtworksResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final List<ArtworkInfo> products;

  const Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class ArtworkInfo {
  final String id, title, category;
  final num price;
  final bool isAvailable;
  final Owner owner;
  final CoverImage coverImage;

  const ArtworkInfo({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.isAvailable,
    required this.owner,
    required this.coverImage,
  });

  factory ArtworkInfo.fromJson(Map<String, dynamic> json) =>
      _$ArtworkInfoFromJson(json);
}

@JsonSerializable()
class CoverImage {
  final String image;

  const CoverImage({required this.image});

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);
}

@JsonSerializable()
class Owner {
  final String id, name;

  const Owner({required this.id, required this.name});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
