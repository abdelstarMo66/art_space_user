import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/book_exhibition_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_all_exhibitions_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_exhibition_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'exhibition_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ExhibitionApiService {
  factory ExhibitionApiService(Dio dio, {String baseUrl}) = _ExhibitionApiService;

  @GET(ApiConstants.getAllExhibition)
  Future<GetAllExhibitionResponse> getAllExhibitions({
    @Header('Authorization') required String token,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sort') String? sortBy,
    @Query('duration[lte]') int? minDuration,
    @Query('duration[gte]') int? maxDuration,
  });

  @GET(ApiConstants.getExhibition)
  Future<GetExhibitionResponse> getExhibition({
    @Header('Authorization') required String token,
    @Path("exhibitionId") required String exhibitionId,
  });

  @POST(ApiConstants.bookExhibition)
  Future<BookExhibitionResponse> bookExhibition({
    @Header('Authorization') required String token,
    @Path("exhibitionId") required String exhibitionId,
  });
}
