import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_exhibition_response.g.dart';

@JsonSerializable()
class GetExhibitionResponse {
  final String message, status;
  final int code;
  final SingleExhibition data;

  const GetExhibitionResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetExhibitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExhibitionResponseFromJson(json);
}

@JsonSerializable()
class SingleExhibition {
  final String id, title, description, coverImage, began, end;
  final int duration;
  final Owner owner;
  final bool userBookedThisEvent;
  @JsonKey(name: "products")
  final List<Artworks> artworks;

  const SingleExhibition({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.began,
    required this.end,
    required this.duration,
    required this.userBookedThisEvent,
    required this.owner,
    required this.artworks,
  });

  factory SingleExhibition.fromJson(Map<String, dynamic> json) =>
      _$SingleExhibitionFromJson(json);
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

@JsonSerializable()
class Artworks {
  final String id, title, coverImage, category;
  final int price;
  @JsonKey(name: "owner")
  final Artist artist;

  const Artworks({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.category,
    required this.price,
    required this.artist,
  });

  factory Artworks.fromJson(Map<String, dynamic> json) =>
      _$ArtworksFromJson(json);
}

@JsonSerializable()
class Artist {
  final String id, name;

  const Artist({
    required this.id,
    required this.name,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}
