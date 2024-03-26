import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/auth/data/models/login/requests/login_request_body.dart';
import 'package:art_space_user/features/auth/data/models/login/responses/login_response.dart';
import 'package:art_space_user/features/auth/data/repos/login_repo.dart';
import 'package:art_space_user/features/auth/logic/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginInitial());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void emitLoginState() async {
    emit(LoginLoadingState());

    final response = await _loginRepo.login(
      LoginRequestBody(
          email: emailController.text, password: passwordController.text),
    );

    response.when(success: (LoginResponse response) {
      SharedPreferencesManager.saveData(
          key: PrefsManager.token, value: response.data.token);
      emit(LoginSuccessState(response));
    }, failure: (ErrorHandler error) {
      emit(LoginFailureState(message: error.apiErrorModel.message));
    });
  }
}
