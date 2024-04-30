import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_category_response.g.dart';

@JsonSerializable()
class GetCategoryResponse {
  final String message, status;
  final int code;
  final List<Category> data;

  const GetCategoryResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryResponseFromJson(json);
}

@HiveType(typeId: 0)
@JsonSerializable()
class Category {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  const Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 0;

  @override
  Category read(BinaryReader reader) {
    return Category(
      id: reader.readString(),
      title: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
  }
}
