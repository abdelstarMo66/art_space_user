import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_style_response.g.dart';

@JsonSerializable()
class GetStyleResponse {
  final String message, status;
  final int code;
  final List<Style> data;

  const GetStyleResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetStyleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStyleResponseFromJson(json);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Style {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  const Style({
    required this.id,
    required this.title,
  });

  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
}

class StyleAdapter extends TypeAdapter<Style> {
  @override
  final int typeId = 1;

  @override
  Style read(BinaryReader reader) {
    return Style(
      id: reader.readString(),
      title: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Style obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
  }
}
