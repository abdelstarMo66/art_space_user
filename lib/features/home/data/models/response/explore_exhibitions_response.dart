import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_exhibitions_response.g.dart';

@JsonSerializable()
class ExploreExhibitionResponse {
  final String message, status;
  final int code;
  final Data data;

  const ExploreExhibitionResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory ExploreExhibitionResponse.fromJson(Map<String, dynamic> json) =>
      _$ExploreExhibitionResponseFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "events")
  final List<Exhibition> exhibitions;

  const Data({
    required this.exhibitions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Exhibition {
  final String id, title, description, coverImage, began, end;
  final int duration;
  final Owner owner;

  const Exhibition({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.began,
    required this.end,
    required this.duration,
    required this.owner,
  });

  factory Exhibition.fromJson(Map<String, dynamic> json) =>
      _$ExhibitionFromJson(json);
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
