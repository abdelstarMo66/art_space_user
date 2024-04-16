import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/shared_app_api_service.dart';
import 'package:art_space_user/features/search/data/models/response/search_response.dart';

class SearchRepo {
  final SharedAppApiService _appApiService;

  SearchRepo(this._appApiService);

  Future<ApiResult<SearchResponse>> search({
    required String token,
    required String keyword,
  }) async {
    try {
      final response = await _appApiService.search(
        token: "Bearer $token",
        keyword: keyword,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
