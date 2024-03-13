import 'package:art_space_user/app/art_space_app.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/color_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesManager.init();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: ColorManager.originalWhite,
      systemNavigationBarColor: ColorManager.originalWhite,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ArtSpaceApp(appRouter: AppRouter()));
}
