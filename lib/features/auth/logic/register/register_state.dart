import 'package:art_space_user/features/auth/data/models/register/responses/register_response.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/verify_email_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';

abstract class RegisterStates {}

final class RegisterInitial extends RegisterStates {}

// Register
final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {
  final RegisterResponse response;

  RegisterSuccessState({required this.response});
}

final class RegisterFailureState extends RegisterStates {
  final String message;

  RegisterFailureState({required this.message});
}

// VerifyEmail
final class VerifyEmailLoadingState extends RegisterStates {}

final class VerifyEmailSuccessState extends RegisterStates {
  final VerifyEmailResponse response;

  VerifyEmailSuccessState({required this.response});
}

final class VerifyEmailFailureState extends RegisterStates {
  final String message;

  VerifyEmailFailureState({required this.message});
}

// ResendCode
final class ResendCodeLoadingState extends RegisterStates {}

final class ResendCodeSuccessState extends RegisterStates {
  final ResendCodeResponse response;

  ResendCodeSuccessState({required this.response});
}

final class ResendCodeFailureState extends RegisterStates {
  final String message;

  ResendCodeFailureState({required this.message});
}
