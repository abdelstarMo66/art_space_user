// import 'package:hive/hive.dart';
//
// @HiveType(typeId: 0)
// class CategoryCachedModel {
//   @HiveField(0)
//   final String id;
//
//   @HiveField(1)
//   final String title;
//
//   const CategoryCachedModel({
//     required this.id,
//     required this.title,
//   });
// }
//
// class CategoryAdapter extends TypeAdapter<CategoryCachedModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   CategoryCachedModel read(BinaryReader reader) {
//     return CategoryCachedModel(
//       id: reader.readString(),
//       title: reader.readString(),
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, CategoryCachedModel obj) {
//     writer.writeString(obj.id);
//     writer.writeString(obj.title);
//   }
// }
