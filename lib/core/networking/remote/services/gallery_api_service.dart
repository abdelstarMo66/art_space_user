import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/gallery/data/models/request/bid_auction_request_body.dart';
import 'package:art_space_user/features/gallery/data/models/response/bid_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_all_auctions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_booked_exhibitions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_registered_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/register_auction_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'gallery_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class GalleryApiService {
  factory GalleryApiService(Dio dio, {String baseUrl}) = _GalleryApiService;

  @GET(ApiConstants.getAllAuctions)
  Future<GetAllAuctionsResponse> getAllAuctions({
    @Header('Authorization') required String token,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(ApiConstants.getAuction)
  Future<GetAuctionResponse> getAuction({
    @Header('Authorization') required String token,
    @Path('auctionId') required String actionId,
  });

  @PATCH(ApiConstants.bid)
  Future<BidAuctionResponse> bidAuction({
    @Header('Authorization') required String token,
    @Path('auctionId') required String actionId,
    @Body() required BidAuctionRequestBody bidAuctionRequestBody,
  });

  @GET(ApiConstants.getBookedExhibitions)
  Future<GetBookedExhibitionsResponse> getBookedExhibitions({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstants.getRegisteredAuction)
  Future<GetRegisteredAuctionResponse> getRegisteredAuction({
    @Header('Authorization') required String token,
  });

  @GET(ApiConstants.registerAuction)
  Future<RegisterAuctionResponse> registerAuction({
    @Header('Authorization') required String token,
    @Path('auctionId') required String actionId,
  });
}
