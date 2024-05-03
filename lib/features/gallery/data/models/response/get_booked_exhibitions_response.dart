import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_booked_exhibitions_response.g.dart';

@JsonSerializable()
class GetBookedExhibitionsResponse {
  final String message, status;
  final int code;
  final Data data;

  const GetBookedExhibitionsResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetBookedExhibitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBookedExhibitionsResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String id;
  @JsonKey(name: "events")
  final List<BookedExhibition> exhibitions;

  const Data({required this.id, required this.exhibitions});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class BookedExhibition {
  final String id, title, description, began, end, ownerId, ownerName;
  final String? coverImage, profileImg;
  final int duration;

  const BookedExhibition({
    required this.id,
    required this.title,
    required this.description,
    required this.began,
    required this.end,
    required this.ownerId,
    required this.ownerName,
    required this.coverImage,
    required this.profileImg,
    required this.duration,
  });

  factory BookedExhibition.fromJson(Map<String, dynamic> json) =>
      _$BookedExhibitionFromJson(json);
}
