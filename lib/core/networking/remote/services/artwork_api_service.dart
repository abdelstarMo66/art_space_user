import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_all_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_artwork_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_category_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_style_response.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_subject_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'artwork_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ArtworkApiService {
  factory ArtworkApiService(Dio dio, {String baseUrl}) = _ArtworkApiService;

  @GET(ApiConstants.getAllArtwork)
  Future<GetAllArtworksResponse> getAllArtworks({
    @Header('Authorization') required String token,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sort') String? sortBy,
    @Query('category') List<String>? category,
    @Query('style') List<String>? style,
    @Query('subject') List<String>? subject,
    @Query('price[lte]') int? minPrice,
    @Query('price[gte]') int? maxPrice,
  });

  @GET(ApiConstants.getArtwork)
  Future<GetArtworkResponse> getArtwork({
    @Header('Authorization') required String token,
    @Path("artworkId") required String artworkId,
  });

  @GET(ApiConstants.getCategory)
  Future<GetCategoryResponse> getCategories({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstants.getStyle)
  Future<GetStyleResponse> getStyles({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstants.getSubject)
  Future<GetSubjectResponse> getSubjects({
    @Header('Authorization') required String token,
  });
}
