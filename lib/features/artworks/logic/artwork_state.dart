import 'package:art_space_user/features/artworks/data/models/response/get_all_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_category_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_style_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_subject_response.dart';

abstract class ArtworkStates {}

class ArtworkInitial extends ArtworkStates {}

class GetAllArtworksLoading extends ArtworkStates {}

class GetAllArtworksSuccess extends ArtworkStates {
  final GetAllArtworksResponse getAllArtworksResponse;

  GetAllArtworksSuccess(this.getAllArtworksResponse);
}

class GetAllArtworksFailure extends ArtworkStates {
  final String message;

  GetAllArtworksFailure(this.message);
}

class GetArtworkLoading extends ArtworkStates {}

class GetArtworkSuccess extends ArtworkStates {
  final GetArtworkResponse getArtworkResponse;

  GetArtworkSuccess(this.getArtworkResponse);
}

class GetArtworkFailure extends ArtworkStates {
  final String message;

  GetArtworkFailure(this.message);
}

class GetCategoryLoading extends ArtworkStates {}

class GetCategorySuccess extends ArtworkStates {
  final List<Category> categories;

  GetCategorySuccess(this.categories);
}

class GetCacheCategorySuccess extends ArtworkStates {
  final List<Category> categories;

  GetCacheCategorySuccess(this.categories);
}

class GetCategoryFailure extends ArtworkStates {
  final String message;

  GetCategoryFailure(this.message);
}

class GetStyleLoading extends ArtworkStates {}

class GetStyleSuccess extends ArtworkStates {
  final List<Style> style;

  GetStyleSuccess(this.style);
}

class GetCacheStyleSuccess extends ArtworkStates {
  final List<Style> styles;

  GetCacheStyleSuccess(this.styles);
}

class GetStyleFailure extends ArtworkStates {
  final String message;

  GetStyleFailure(this.message);
}

class GetSubjectLoading extends ArtworkStates {}

class GetSubjectSuccess extends ArtworkStates {
  final List<Subject> subject;

  GetSubjectSuccess(this.subject);
}

class GetCacheSubjectSuccess extends ArtworkStates {
  final List<Subject> subject;

  GetCacheSubjectSuccess(this.subject);
}

class GetSubjectFailure extends ArtworkStates {
  final String message;

  GetSubjectFailure(this.message);
}
