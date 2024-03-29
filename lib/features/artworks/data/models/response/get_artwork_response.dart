// import 'package:json_annotation/json_annotation.dart';
//
// part 'get_artwork_response.g.dart';
//
// @JsonSerializable()
// class GetArtworksResponse {
//   final String? status;
//   final String? message;
//   final int code;
//   @JsonKey(name: 'data')
//   Artwork? artworks;
//
//   GetArtworksResponse({
//     required this.status,
//     required this.code,
//     required this.message,
//     this.artworks,
//   });
//
//   factory GetArtworksResponse.fromJson(Map<String, dynamic> json) =>
//       _$GetArtworksResponseFromJson(json);
// }
//
// @JsonSerializable()
// class Artwork {
//   final Pagination? pagination;
//   @JsonKey(name: 'products')
//   final List<ArtworkInfo>? artworksInfo;
//
//   Artwork({this.artworksInfo, this.pagination});
//
//   factory Artwork.fromJson(Map<String, dynamic> json) =>
//       _$ArtworkFromJson(json);
// }
//
// @JsonSerializable()
// class Pagination {
//   int? currentPage;
//   int? limit;
//   int? numbersOfPages;
//   int? totalResults;
//
//   Pagination(
//       {this.currentPage, this.limit, this.numbersOfPages, this.totalResults});
//
//   factory Pagination.fromJson(Map<String, dynamic> json) =>
//       _$PaginationFromJson(json);
// }
//
// @JsonSerializable()
// class ArtworkInfo {
//   String? id;
//   String? title;
//   String? description;
//   num? price;
//   String? isAvailable;
//   CoverImage? coverImage;
//
//   ArtworkInfo(
//       {this.id,
//       this.title,
//       this.description,
//       this.price,
//       this.coverImage,
//       this.isAvailable});
//
//   factory ArtworkInfo.fromJson(Map<String, dynamic> json) =>
//       _$ArtworkInfoFromJson(json);
// }
//
// @JsonSerializable()
// class CoverImage {
//   String? imageId;
//   String? profileImg;
//
//   CoverImage({this.imageId, this.profileImg});
//
//   factory CoverImage.fromJson(Map<String, dynamic> json) =>
//       _$CoverImageFromJson(json);
// }
