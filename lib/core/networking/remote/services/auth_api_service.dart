import 'package:art_space_user/features/auth/data/models/forget_password/requests/forget_password_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/reset_password_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/verify_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/forget_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/reset_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/verify_code_response.dart';
import 'package:art_space_user/features/auth/data/models/login/requests/login_request_body.dart';
import 'package:art_space_user/features/auth/data/models/login/responses/login_response.dart';
import 'package:art_space_user/features/auth/data/models/register/requests/register_request_body.dart';
import 'package:art_space_user/features/auth/data/models/register/requests/verify_email_request_body.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/register_response.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/verify_email_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/request/resend_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/variable_manager.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  // login
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  // register
  @POST(ApiConstants.register)
  Future<RegisterResponse> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.verifyEmail)
  Future<VerifyEmailResponse> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
  );

  // forget password
  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
  );

  @POST(ApiConstants.verifyCode)
  Future<VerifyCodeResponse> verifyCode(
    @Body() VerifyCodeRequestBody verifyCodeRequestBody,
  );

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequestBody resetPasswordRequestBody,
  );

  // resend code
  @GET(ApiConstants.resendCode)
  Future<ResendCodeResponse> resendCode(
    @Body() ResendCodeRequestBody resendCodeRequestBody,
  );
}
