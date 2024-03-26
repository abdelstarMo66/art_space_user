import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/auth/data/models/register/requests/register_request_body.dart';
import 'package:art_space_user/features/auth/data/models/register/requests/verify_email_request_body.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/register_response.dart';
import 'package:art_space_user/features/auth/data/models/register/responses/verify_email_response.dart';
import 'package:art_space_user/features/auth/data/models/shared/request/resend_code_request_body.dart';
import 'package:art_space_user/features/auth/data/models/shared/response/resend_code_response.dart';
import 'package:art_space_user/features/auth/data/repos/register_repo.dart';
import 'package:art_space_user/features/auth/logic/register/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool isMale = true;

  void emitRegisterState() async {
    emit(RegisterLoadingState());

    final response = await _registerRepo.register(
      RegisterRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
        phone: phoneController.text,
        gender: isMale ? "male" : "female",
      ),
    );

    response.when(
      success: (RegisterResponse response) {
        emit(RegisterSuccessState(response: response));
      },
      failure: (ErrorHandler error) {
        emit(RegisterFailureState(message: error.apiErrorModel.message));
      },
    );
  }

  void emitVerifyEmailState({required String email}) async {
    emit(VerifyEmailLoadingState());

    final response = await _registerRepo.verifyEmail(
      VerifyEmailRequestBody(
        email: email,
        activateCode: otpController.text,
      ),
    );

    response.when(
      success: (VerifyEmailResponse response) {
        SharedPreferencesManager.saveData(
            key: PrefsManager.token, value: response.data.token);
        emit(VerifyEmailSuccessState(response: response));
      },
      failure: (ErrorHandler error) {
        emit(VerifyEmailFailureState(message: error.apiErrorModel.message));
      },
    );
  }

  void emitResendCodeState({required String email}) async {
    emit(ResendCodeLoadingState());

    final response = await _registerRepo.resendCode(
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
