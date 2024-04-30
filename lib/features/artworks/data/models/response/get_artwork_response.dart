import 'package:json_annotation/json_annotation.dart';

part 'get_artwork_response.g.dart';

@JsonSerializable()
class GetArtworkResponse {
  final String status, message;
  final int code;
  final Data data;

  GetArtworkResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetArtworkResponse.fromJson(Map<String, dynamic> json) =>
      _$GetArtworkResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id, title, description, category, style, subject, size;
  final String? material;
  final num price;
  final bool isAvailable;
  final Owner owner;
  final ArtworkImage coverImage;
  final List<ArtworkImage> images;

  const Data({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.style,
    required this.subject,
    required this.size,
    required this.material,
    required this.price,
    required this.isAvailable,
    required this.owner,
    required this.coverImage,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class ArtworkImage {
  final String image;

  const ArtworkImage({required this.image});

  factory ArtworkImage.fromJson(Map<String, dynamic> json) =>
      _$ArtworkImageFromJson(json);
}

@JsonSerializable()
class Owner {
  final String id, name, profileImg;

  const Owner({
    required this.id,
    required this.name,
    required this.profileImg,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
