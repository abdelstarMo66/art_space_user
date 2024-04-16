import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  final String message, status;
  final int code;
  final Data data;

  const SearchResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final int resultCount;
  final List<Product> products;
  final List<Artist> artists;
  final List<Event> events;

  const Data({
    required this.resultCount,
    required this.products,
    required this.artists,
    required this.events,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Product {
  final String id, title, category;
  final num price;
  final bool isAvailable;
  final String? profileImg;
  final Owner owner;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.isAvailable,
    required this.profileImg,
    required this.owner,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@JsonSerializable()
class Artist {
  final String id, name, email;
  final String? profileImg;
  final bool accountActive;

  const Artist({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImg,
    required this.accountActive,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@JsonSerializable()
class Event {
  final String title, began;
  final int duration;
  final Owner owner;

  const Event({
    required this.title,
    required this.began,
    required this.duration,
    required this.owner,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@JsonSerializable()
class Owner {
  final String id, name;

  const Owner({
    required this.id,
    required this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
