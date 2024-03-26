import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/auth_api_service.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/forget_password_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/reset_password_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/verify_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/forget_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/reset_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/verify_code_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/request/resend_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';

class ForgetPasswordRepo {
  final AuthApiService _authApiService;

  const ForgetPasswordRepo(this._authApiService);

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequestBody forgetPasswordRequestBody) async {
    try {
      final response =
          await _authApiService.forgetPassword(forgetPasswordRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<VerifyCodeResponse>> verifyCode(
      VerifyCodeRequestBody verifyCodeRequestBody) async {
    try {
      final response = await _authApiService.verifyCode(verifyCodeRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequestBody resetPasswordRequestBody) async {
    try {
      final response =
          await _authApiService.resetPassword(resetPasswordRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResendCodeResponse>> resendCode(
      ResendCodeRequestBody resendCodeRequestBody) async {
    try {
      final response = await _authApiService.resendCode(resendCodeRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
