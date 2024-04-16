import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/shared_app_api_service.dart';
import 'package:art_space_user/features/artist/data/models/response/artist_response.dart';

class ArtistRepo {
  final SharedAppApiService _appApiService;

  ArtistRepo(this._appApiService);

  Future<ApiResult<ArtistResponse>> getArtist({
    required String token,
    required String artistId,
  }) async {
    try {
      final response = await _appApiService.artist(
        token: 'Bearer $token',
        artistId: artistId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
