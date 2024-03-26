import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/forget_password_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/reset_password_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/requests/verify_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/forget_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/reset_password_response.dart';
import 'package:art_space_user/features/auth/data/models/forget_password/responses/verify_code_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/request/resend_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';
import 'package:art_space_user/features/auth/data/repos/forget_password_repo.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(ForgetPasswordInitial());

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void emitForgetPasswordState() async {
    emit(ForgetPasswordLoadingState());

    final response = await _forgetPasswordRepo.forgetPassword(
      ForgetPasswordRequestBody(
        email: emailController.text,
      ),
    );

    response.when(
      success: (ForgetPasswordResponse forgetPasswordResponse) {
        emit(ForgetPasswordSuccessState(forgetPasswordResponse));
      },
      failure: (ErrorHandler error) {
        emit(ForgetPasswordFailureState(message: error.apiErrorModel.message));
      },
    );
  }

  void emitVerifyCodeState({required String email}) async {
    emit(VerifyCodeLoadingState());

    final response = await _forgetPasswordRepo.verifyCode(
      VerifyCodeRequestBody(
        email: email,
        resetCode: otpController.text,
      ),
    );

    response.when(
      success: (VerifyCodeResponse verifyCodeResponse) {
        emit(VerifyCodeSuccessState(verifyCodeResponse));
      },
      failure: (ErrorHandler error) {
        emit(VerifyCodeFailureState(message: error.apiErrorModel.message));
      },
    );
  }

  void emitResetPasswordState({required String email}) async {
    emit(ResetPasswordLoadingState());

    final response = await _forgetPasswordRepo.resetPassword(
      ResetPasswordRequestBody(
        email: email,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
      ),
    );

    response.when(
      success: (ResetPasswordResponse response) {
        SharedPreferencesManager.saveData(
            key: PrefsManager.token, value: response.data.token);
        emit(ResetPasswordSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(ResetPasswordFailureState(message: error.apiErrorModel.message));
      },
    );
  }

  void emitResendCodeState({required String email}) async {
    emit(ResendCodeLoadingState());

    final response = await _forgetPasswordRepo.resendCode(
      ResendCodeRequestBody(
        email: email,
      ),
    );

    response.when(
      success: (ResendCodeResponse response) {
        emit(ResendCodeSuccessState(response: response));
      },
      failure: (ErrorHandler error) {
        emit(ResendCodeFailureState(message: error.apiErrorModel.message));
      },
    );
  }
}
