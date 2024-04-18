import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/home/data/models/response/explore_exhibitions_response.dart';
import 'package:art_space_user/features/home/data/models/response/recently_artwork_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(ApiConstants.exploreExhibition)
  Future<ExploreExhibitionResponse> exploreExhibition({
    @Header('Authorization') required String token,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  @GET(ApiConstants.recentlyArtwork)
  Future<RecentlyArtworksResponse> recentlyArtworks({
    @Header('Authorization') required String token,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });
}
