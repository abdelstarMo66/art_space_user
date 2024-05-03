import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/exhibition_api_service.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/book_exhibition_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_all_exhibitions_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_exhibition_response.dart';

class ExhibitionRepo {
  final ExhibitionApiService _exhibitionApiService;

  ExhibitionRepo(this._exhibitionApiService);

  Future<ApiResult<GetAllExhibitionResponse>> getAllExhibition({
    required String token,
    int? page,
    int? limit,
    String? sort,
    int? durationFrom,
    int? durationTo,
  }) async {
    try {
      final response = await _exhibitionApiService.getAllExhibitions(
        token: 'Bearer $token',
        page: page,
        limit: limit,
        sortBy: sort,
        minDuration: durationFrom,
        maxDuration: durationTo,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetExhibitionResponse>> getExhibition({
    required String token,
    required String exhibitionId,
  }) async {
    try {
      final response = await _exhibitionApiService.getExhibition(
        token: 'Bearer $token',
        exhibitionId: exhibitionId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BookExhibitionResponse>> bookExhibition({
    required String token,
    required String exhibitionId,
  }) async {
    try {
      final response = await _exhibitionApiService.bookExhibition(
        token: 'Bearer $token',
        exhibitionId: exhibitionId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
