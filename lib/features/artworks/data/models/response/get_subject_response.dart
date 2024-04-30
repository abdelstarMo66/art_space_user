import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'get_subject_response.g.dart';

@JsonSerializable()
class GetSubjectResponse {
  final String message, status;
  final int code;
  final List<Subject> data;

  const GetSubjectResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory GetSubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubjectResponseFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Subject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  const Subject({
    required this.id,
    required this.title,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

class SubjectAdapter extends TypeAdapter<Subject> {
  @override
  final int typeId = 2;

  @override
  Subject read(BinaryReader reader) {
    return Subject(
      id: reader.readString(),
      title: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Subject obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
  }
}
