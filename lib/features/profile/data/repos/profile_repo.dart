import 'dart:io';

import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/profile_api_service.dart';
import 'package:art_space_user/features/profile/data/models/request/add_address_request_body.dart';
import 'package:art_space_user/features/profile/data/models/request/change_password_request_body.dart';
import 'package:art_space_user/features/profile/data/models/request/update_profile_request_body.dart';
import 'package:art_space_user/features/profile/data/models/response/add_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/change_password_response.dart';
import 'package:art_space_user/features/profile/data/models/response/delete_address_response.dart';
import 'package:art_space_user/features/profile/data/models/response/get_profile_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_image_response.dart';
import 'package:art_space_user/features/profile/data/models/response/update_profile_response.dart';

class ProfileRepo {
  final ProfileApiService _profileApiService;

  ProfileRepo(this._profileApiService);

  Future<ApiResult<GetProfileResponse>> getProfile(
      {required String token}) async {
    try {
      final response =
          await _profileApiService.getProfile(token: "Bearer $token");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required String token,
    required ChangePasswordRequestBody changePasswordRequestBody,
  }) async {
    try {
      final response = await _profileApiService.changePassword(
        token: "Bearer $token",
        changePasswordRequest: changePasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateProfileResponse>> updateProfile({
    required String token,
    required UpdateProfileRequestBody updateProfileRequesBody,
  }) async {
    try {
      final response = await _profileApiService.updateProfile(
        token: "Bearer $token",
        updateProfileRequest: updateProfileRequesBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddAddressResponse>> addAddress({
    required String token,
    required AddAddressRequestBody addAddressRequestBody,
  }) async {
    try {
      final response = await _profileApiService.addAddress(
        token: "Bearer $token",
        addAddressRequestBody: addAddressRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DeleteAddressResponse>> deleteAddress({
    required String token,
    required String addressId,
  }) async {
    try {
      final response = await _profileApiService.deleteAddress(
        token: "Bearer $token",
        addressId: addressId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateProfileImageResponse>> updateProfileImage({
    required String token,
    required File profileImage,
  }) async {
    try {
      final response = await _profileApiService.updateProfileImage(
        token: "Bearer $token",
        profileImg: profileImage,
      );
      return ApiResult.success(response);
    } catch (error) {
      print(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
