import 'package:art_space_user/core/app_cubit/app_cubit.dart';
import 'package:art_space_user/core/networking/remote/dio_factory.dart';
import 'package:art_space_user/core/networking/remote/services/auth_api_service.dart';
import 'package:art_space_user/features/auth/data/repos/forget_password_repo.dart';
import 'package:art_space_user/features/auth/data/repos/login_repo.dart';
import 'package:art_space_user/features/auth/data/repos/register_repo.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/logic/login/login_cubit.dart';
import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // app
  getIt.registerFactory<AppCubit>(() => AppCubit());

  // dio && ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<AuthApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // forgetPassword
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt<AuthApiService>()));
  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<ForgetPasswordRepo>()));

  // register
  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepo(getIt<AuthApiService>()));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));
}
