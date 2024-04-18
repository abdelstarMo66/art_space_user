import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/cart/data/models/request/add_cart_request_body.dart';
import 'package:art_space_user/features/cart/data/models/response/add_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/delete_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/get_cart_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

  @GET(ApiConstants.cart)
  Future<GetCartResponse> getCart({
    @Header("Authorization") required String token,
  });

  @POST(ApiConstants.cart)
  Future<AddCartResponse> addCart({
    @Header("Authorization") required String token,
    @Body() required AddCartRequestBody productId,
  });

  @DELETE(ApiConstants.deleteCart)
  Future<DeleteCartResponse> deleteCart({
    @Header('Authorization') required String token,
    @Path("productId") required String productId,
  });
}
