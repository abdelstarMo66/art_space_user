import 'package:art_space_user/features/cart/ui/cart_screen.dart';
import 'package:art_space_user/features/gallery/ui/gallery_screen.dart';
import 'package:art_space_user/features/home/ui/home_screen.dart';
import 'package:art_space_user/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/assets_manager.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitAppState());

  List<String> bottomNavBarIcons = [
    AssetsManager.icHome,
    AssetsManager.icGallery,
    AssetsManager.icCart,
    AssetsManager.icProfile,
  ];
  List<String> bottomNavBarTexts = const [
    "Home",
    "Gallery",
    "Cart",
    "Profile",
  ];
  List<Widget> bottomNavBarBody = const [
    HomeScreen(),
    GalleryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int currentPageIndex = 0;

  void setCurrentPageIndex(int index) {
    currentPageIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
