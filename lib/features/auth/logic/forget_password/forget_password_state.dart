import 'package:art_space_user/features/auth/data/models/forget_password/responses/forget_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/reset_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/verify_code_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';

abstract class ForgetPasswordStates {}

final class ForgetPasswordInitial extends ForgetPasswordStates {}

final class ForgetPasswordLoadingState extends ForgetPasswordStates {}

final class ForgetPasswordSuccessState extends ForgetPasswordStates {
  final ForgetPasswordResponse response;

  ForgetPasswordSuccessState(this.response);
}

final class ForgetPasswordFailureState extends ForgetPasswordStates {
  final String message;

  ForgetPasswordFailureState({required this.message});
}

// VerifyCode
final class VerifyCodeLoadingState extends ForgetPasswordStates {}

final class VerifyCodeSuccessState extends ForgetPasswordStates {
  final VerifyCodeResponse response;

  VerifyCodeSuccessState(this.response);
}

final class VerifyCodeFailureState extends ForgetPasswordStates {
  final String message;

  VerifyCodeFailureState({required this.message});
}

// ResetPassword
final class ResetPasswordLoadingState extends ForgetPasswordStates {}

final class ResetPasswordSuccessState extends ForgetPasswordStates {
  final ResetPasswordResponse response;

  ResetPasswordSuccessState(this.response);
}

final class ResetPasswordFailureState extends ForgetPasswordStates {
  final String message;

  ResetPasswordFailureState({required this.message});
}

// ResendCode
final class ResendCodeLoadingState extends ForgetPasswordStates {}

final class ResendCodeSuccessState extends ForgetPasswordStates {
  final ResendCodeResponse response;

  ResendCodeSuccessState({required this.response});
}

final class ResendCodeFailureState extends ForgetPasswordStates {
  final String message;

  ResendCodeFailureState({required this.message});
}
