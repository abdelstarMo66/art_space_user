import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/cart_api_service.dart';
import 'package:art_space_user/features/cart/data/models/request/add_cart_request_body.dart';
import 'package:art_space_user/features/cart/data/models/request/create_card_order_request_body.dart';
import 'package:art_space_user/features/cart/data/models/request/create_cash_order_request_body.dart';
import 'package:art_space_user/features/cart/data/models/response/add_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/create_card_order_response.dart';
import 'package:art_space_user/features/cart/data/models/response/create_cash_order_response.dart';
import 'package:art_space_user/features/cart/data/models/response/delete_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/get_cart_response.dart';

class CartRepo {
  final CartApiService _cartApiService;

  const CartRepo(this._cartApiService);

  Future<ApiResult<GetCartResponse>> getCart({required String token}) async {
    try {
      final response = await _cartApiService.getCart(token: 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddCartResponse>> addCart({
    required String token,
    required String productId,
  }) async {
    try {
      final response = await _cartApiService.addCart(
        token: 'Bearer $token',
        productId: AddCartRequestBody(productId: productId),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DeleteCartResponse>> deleteCart({
    required String token,
    required String productId,
  }) async {
    try {
      final response = await _cartApiService.deleteCart(
        token: 'Bearer $token',
        productId: productId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreateCashOrderResponse>> createCashOrder({
    required String token,
    required String cartId,
    required String shippingAddressId,
  }) async {
    try {
      final response = await _cartApiService.createCashOrder(
        token: 'Bearer $token',
        cartId: cartId,
        cashOrderRequestBody:
            CreateCashOrderRequestBody(shippingAddress: shippingAddressId),
      );
      return ApiResult.success(response);
    } catch (error) {
      print(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreateCardOrderResponse>> createCardOrder({
    required String token,
    required String cartId,
    required String shippingAddressId,
  }) async {
    try {
      final response = await _cartApiService.createCardOrder(
        token: 'Bearer $token',
        cartId: cartId,
        cardOrderRequestBody:
            CreateCardOrderRequestBody(shippingAddress: shippingAddressId),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
