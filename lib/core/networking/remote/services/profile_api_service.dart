import 'dart:io';

import 'package:art_space_user/core/utils/variable_manager.dart';
import 'package:art_space_user/features/profile/data/models/request/add_address_request_body.dart';
import 'package:art_space_user/features/profile/data/models/request/change_password_request_body.dart';
import 'package:art_space_user/features/profile/data/models/request/update_profile_request_body.dart';
import 'package:art_space_user/features/profile/data/models/response/add_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/change_password_response.dart';
import 'package:art_space_user/features/profile/data/models/response/delete_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/get_addresses_response.dart';
import 'package:art_space_user/features/profile/data/models/response/get_profile_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_image_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_response.dart';
import 'package:art_space_user/features/profile/data/models/response/your_order_response.dart';
import 'package:art_space_user/features/profile/data/models/response/your_orders_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/http.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @GET(ApiConstants.getProfile)
  Future<GetProfileResponse> getProfile({
    @Header("Authorization") required String token,
  });

  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordResponse> changePassword({
    @Header("Authorization") required String token,
    @Body() required ChangePasswordRequestBody changePasswordRequest,
  });

  @PATCH(ApiConstants.updateProfile)
  Future<UpdateProfileResponse> updateProfile({
    @Header("Authorization") required String token,
    @Body() required UpdateProfileRequestBody updateProfileRequest,
  });

  @POST(ApiConstants.address)
  Future<AddAddressResponse> addAddress({
    @Header("Authorization") required String token,
    @Body() required AddAddressRequestBody addAddressRequestBody,
  });

  @DELETE(ApiConstants.removeAddress)
  Future<DeleteAddressResponse> deleteAddress({
    @Header("Authorization") required String token,
    @Path("addressId") required String addressId,
  });

  @GET(ApiConstants.address)
  Future<GetAddressResponse> getAddresses({
    @Header("Authorization") required String token,
  });

  @PUT(ApiConstants.updateImage)
  @MultiPart()
  Future<UpdateProfileImageResponse> updateProfileImage({
    @Header("Authorization") required String token,
    @Part(contentType: "image/*") required File profileImg,
  });

  @GET(ApiConstants.orders)
  Future<YourOrdersResponse> orders({
    @Header("Authorization") required String token,
  });

  @GET(ApiConstants.orderDetails)
  Future<YourOrderResponse> orderDetails({
    @Header("Authorization") required String token,
    @Path("orderId") required String orderId,
  });
}
