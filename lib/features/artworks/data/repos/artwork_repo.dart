import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/artwork_api_service.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_all_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_category_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_style_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_subject_response.dart';

class ArtworkRepo {
  final ArtworkApiService _artworkApiService;

  ArtworkRepo(this._artworkApiService);

  Future<ApiResult<GetAllArtworksResponse>> getAllArtworks({
    required String token,
    int? page,
    int? limit,
    String? sort,
    List<String>? category,
    List<String>? style,
    List<String>? subject,
    int? priceFrom,
    int? priceTo,
  }) async {
    try {
      final response = await _artworkApiService.getAllArtworks(
        token: 'Bearer $token',
        page: page,
        limit: limit,
        sortBy: sort,
        category: category,
        style: style,
        subject: subject,
        minPrice: priceFrom,
        maxPrice: priceTo,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetArtworkResponse>> getArtwork({
    required String token,
    required String artworkId,
  }) async {
    try {
      final response = await _artworkApiService.getArtwork(
        token: 'Bearer $token',
        artworkId: artworkId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetCategoryResponse>> getCategories(
      {required String token}) async {
    try {
      final response = await _artworkApiService.getCategories(
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetStyleResponse>> getStyles({required String token}) async {
    try {
      final response = await _artworkApiService.getStyles(
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetSubjectResponse>> getSubjects(
      {required String token}) async {
    try {
      final response = await _artworkApiService.getSubjects(
        token: 'Bearer $token',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
