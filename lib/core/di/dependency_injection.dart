import 'package:art_space_user/core/app_cubit/app_cubit.dart';
import 'package:art_space_user/core/networking/remote/dio_factory.dart';
import 'package:art_space_user/core/networking/remote/services/artwork_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/auth_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/cart_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/exhibition_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/home_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/profile_api_service.dart';
import 'package:art_space_user/core/networking/remote/services/shared_app_api_service.dart';
import 'package:art_space_user/features/artist/data/repos/artist_repo.dart';
import 'package:art_space_user/features/artist/logic/artist_cubit.dart';
import 'package:art_space_user/features/artworks/data/repos/artwork_repo.dart';
import 'package:art_space_user/features/artworks/logic/artwork_cubit.dart';
import 'package:art_space_user/features/auth/data/repos/forget_password_repo.dart';
import 'package:art_space_user/features/auth/data/repos/login_repo.dart';
import 'package:art_space_user/features/auth/data/repos/register_repo.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/logic/login/login_cubit.dart';
import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:art_space_user/features/cart/data/repos/cart_repo.dart';
import 'package:art_space_user/features/cart/logic/cart_cubit.dart';
import 'package:art_space_user/features/exhibitions/data/repos/exhibition_repo.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_cubit.dart';
import 'package:art_space_user/features/home/data/repos/home_repo.dart';
import 'package:art_space_user/features/home/logic/home_cubit.dart';
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
  getIt.registerLazySingleton<SharedAppApiService>(
      () => SharedAppApiService(dio));
  getIt.registerLazySingleton<ArtworkApiService>(() => ArtworkApiService(dio));
  getIt.registerLazySingleton<ExhibitionApiService>(
      () => ExhibitionApiService(dio));
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<CartApiService>(() => CartApiService(dio));

  // auth repo
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<AuthApiService>()));
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt<AuthApiService>()));
  getIt.registerLazySingleton<RegisterRepo>(
      () => RegisterRepo(getIt<AuthApiService>()));
  // auth cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<ForgetPasswordRepo>()));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepo>()));

  // profile repo and cubit
  getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(getIt<ProfileApiService>()));
  getIt.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(getIt<ProfileRepo>()));

  // search repo and cubit
  getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepo(getIt<SharedAppApiService>()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));

  // artwork repo and cubit
  getIt.registerLazySingleton<ArtworkRepo>(
      () => ArtworkRepo(getIt<ArtworkApiService>()));
  getIt.registerFactory<ArtworkCubit>(() => ArtworkCubit(getIt<ArtworkRepo>()));

  // artist repo and cubit
  getIt.registerLazySingleton<ArtistRepo>(
      () => ArtistRepo(getIt<SharedAppApiService>()));
  getIt.registerFactory<ArtistCubit>(() => ArtistCubit(getIt<ArtistRepo>()));

  // exhibition repo and cubit
  getIt.registerLazySingleton<ExhibitionRepo>(
      () => ExhibitionRepo(getIt<ExhibitionApiService>()));
  getIt.registerFactory<ExhibitionCubit>(
      () => ExhibitionCubit(getIt<ExhibitionRepo>()));

  // home repo and cubit
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // cart repo and cubit
  getIt
      .registerLazySingleton<CartRepo>(() => CartRepo(getIt<CartApiService>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));
}
