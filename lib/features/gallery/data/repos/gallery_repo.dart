import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/gallery_api_service.dart';
import 'package:art_space_user/features/gallery/data/models/request/bid_auction_request_body.dart';
import 'package:art_space_user/features/gallery/data/models/response/bid_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_all_auctions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_auction_response.dart';

class GalleryRepo {
  final GalleryApiService _galleryApiService;

  const GalleryRepo(this._galleryApiService);

  Future<ApiResult<GetAllAuctionsResponse>> getAllAuctions({
    required String token,
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _galleryApiService.getAllAuctions(
        token: 'Bearer $token',
        page: page,
        limit: limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetAuctionResponse>> getAuction({
    required String token,
    required String auctionId,
  }) async {
    try {
      final response = await _galleryApiService.getAuction(
        token: 'Bearer $token',
        actionId: auctionId,
      );
      return ApiResult.success(response);
    } catch (error) {
      print(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BidAuctionResponse>> bidAuction({
    required String token,
    required String auctionId,
    required double bidAmount,
  }) async {
    try {
      final response = await _galleryApiService.bidAuction(
        token: 'Bearer $token',
        actionId: auctionId,
        bidAuctionRequestBody: BidAuctionRequestBody(finalPrice: bidAmount),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
