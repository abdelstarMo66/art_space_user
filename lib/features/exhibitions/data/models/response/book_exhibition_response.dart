import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_exhibition_response.g.dart';

@JsonSerializable()
class BookExhibitionResponse {
  final String message, status;
  final int code;

  const BookExhibitionResponse({
    required this.message,
    required this.status,
    required this.code,
  });

  factory BookExhibitionResponse.fromJson(Map<String, dynamic> json) =>
      _$BookExhibitionResponseFromJson(json);
}
