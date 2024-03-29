import 'package:art_space_user/core/app_cubit/app_cubit.dart';
import 'package:art_space_user/core/networking/remote/dio_factory.dart';
import 'package:art_space_user/core/networking/remote/services/auth_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/profile_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/search_api_service.dart';
import 'package:art_space_user/features/auth/data/repos/forget_password_repo.dart';
import 'package:art_space_user/features/auth/data/repos/login_repo.dart';
import 'package:art_space_user/features/auth/data/repos/register_repo.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/logic/login/login_cubit.dart';
import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:art_space_user/features/profile/data/repos/profile_repo.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/search/data/repos/search_repo.dart';
import 'package:art_space_user/features/search/logic/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // app
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());

  // dio && ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));

  // auth repo
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<AuthApiService>()));
  // auth cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<ForgetPasswordRepo>()));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));

  // profile repo
  getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(getIt<ProfileApiService>()));
  // profile cubit
  getIt.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(getIt<ProfileRepo>()));

  // search repo
  getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepo(getIt<SearchApiService>()));
  // search cubit
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));
}
