import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/artist/data/models/response/artist_response.dart';
import 'package:art_space_user/features/search/data/models/response/search_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'shared_app_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SharedAppApiService {
  factory SharedAppApiService(Dio dio, {String baseUrl}) = _SharedAppApiService;

  @GET(ApiConstants.search)
  Future<SearchResponse> search({
    @Header("Authorization") required String token,
    @Query("keyword") required String keyword,
  });

  @GET(ApiConstants.getArtist)
  Future<ArtistResponse> artist({
    @Header("Authorization") required String token,
    @Path("artistId") required String artistId,
  });
}
