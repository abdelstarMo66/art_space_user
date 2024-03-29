// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:image_picker/image_picker.dart';
//
// part 'update_profile_image_request_body.g.dart';
//
// class XFileConverter implements JsonConverter<XFile?, Map<String, dynamic>?> {
//   const XFileConverter();
//
//   @override
//   XFile? fromJson(Map<String, dynamic>? json) {
//     if (json != null) {
//       return XFile(json['path']);
//     }
//     return null;
//   }
//
//   @override
//   Map<String, dynamic>? toJson(XFile? file) {
//     if (file != null) {
//       return {'path': file.path};
//     }
//     return null;
//   }
// }
//
// @JsonSerializable()
// class UpdateProfileImageRequestBody {
//   @XFileConverter()
//   final XFile? profileImg;
//
//   const UpdateProfileImageRequestBody({
//     this.profileImg,
//   });
//
//   Map<String, dynamic> toJson() => _$UpdateProfileImageRequestBodyToJson(this);
// }

// import 'package:dio/dio.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'update_profile_image_request_body.g.dart';
//
// @JsonSerializable()
// class UpdateProfileImageRequestBody {
//   final FormData? data;
//
//   const UpdateProfileImageRequestBody({
//     this.data,
//   });
//
//   Map<String, dynamic> toJson() => _$UpdateProfileImageRequestBodyToJson(this);
// }
