import 'package:art_space_user/features/auth/data/models/login/responses/login_response.dart';

abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoadingState extends LoginStates {}

final class LoginSuccessState extends LoginStates {
  final LoginResponse response;

  LoginSuccessState(this.response);
}

final class LoginFailureState extends LoginStates {
  final String message;

  LoginFailureState({required this.message});
}
