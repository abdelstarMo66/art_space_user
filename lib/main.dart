import 'dart:async';

import 'package:art_space_user/app/art_space_app.dart';
import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/routing/app_router.dart';
import 'package:art_space_user/core/utils/socket_io_init.dart';
import 'package:art_space_user/features/artworks/data/models/response/get_subject_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app_cubit/bloc_observer.dart';
import 'core/theming/color_manager.dart';
import 'features/artworks/data/models/response/get_category_response.dart';
import 'features/artworks/data/models/response/get_style_response.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = MyBlocObserver();
      SharedPreferencesManager.init();
      await ScreenUtil.ensureScreenSize();
      await setupGetIt();
      initSocket();
      await Hive.initFlutter();
      Hive.registerAdapter(CategoryAdapter());
      Hive.registerAdapter(StyleAdapter());
      Hive.registerAdapter(SubjectAdapter());

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.originalWhite,
          systemNavigationBarColor: ColorManager.originalWhite,
        ),
      );
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      runApp(ArtSpaceApp(appRouter: AppRouter()));
    },
    (error, stackTrace) async {
      debugPrint("Global Error: $error");
      debugPrint("Global StackTrace: $stackTrace");
    },
  );
}
