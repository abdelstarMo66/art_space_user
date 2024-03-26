import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/networking/remote/api_result.dart';
import 'package:art_space_user/core/networking/remote/services/auth_api_service.dart';
import 'package:art_space_user/features/auth/data/models/register/requests/register_request_body.dart';
import 'package:art_space_user/features/auth/data/models/register/requests/verify_email_request_body.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/register_response.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/verify_email_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/request/resend_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';

class RegisterRepo {
  final AuthApiService _authApiService;

  const RegisterRepo(this._authApiService);

  Future<ApiResult<RegisterResponse>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response = await _authApiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<VerifyEmailResponse>> verifyEmail(
      VerifyEmailRequestBody verifyEmailRequestBody) async {
    try {
      final response =
          await _authApiService.verifyEmail(verifyEmailRequestBody);
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
