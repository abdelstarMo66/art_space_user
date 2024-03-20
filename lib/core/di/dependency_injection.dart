import 'package:art_space_user/core/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // app
  getIt.registerFactory<AppCubit>(() => AppCubit());
}
