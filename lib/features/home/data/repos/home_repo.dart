import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/home_api_service.dart';
import 'package:art_space_user/features/home/data/models/response/explore_exhibitions_response.dart';
import 'package:art_space_user/features/home/data/models/response/recently_artwork_response.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  const HomeRepo(this._homeApiService);

  Future<ApiResult<ExploreExhibitionResponse>> exploreExhibition({
    required String token,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _homeApiService.exploreExhibition(
        token: 'Bearer $token',
        page: page,
        limit: limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RecentlyArtworksResponse>> recentlyArtworks({
    required String token,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _homeApiService.recentlyArtworks(
        token: 'Bearer $token',
        page: page,
        limit: limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
