import 'package:flutter/material.dart';

import '../utils/const_variable_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class TextStyleManager {
  static TextStyle font14LightGrayMedium = TextStyle(
    fontSize: FontSizeManager.s14,
    color: ColorManager.lightGray,
    fontWeight: FontWeightManager.medium,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: FontSizeManager.s14,
    color: ColorManager.lightBlack,
    fontWeight: FontWeightManager.medium,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font14DarkPurpleSemiBold = TextStyle(
    fontSize: FontSizeManager.s14,
    color: ColorManager.dartPurple,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font16DarkPurpleBold = TextStyle(
    fontSize: FontSizeManager.s16,
    fontWeight: FontWeightManager.bold,
    color: ColorManager.dartPurple,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font18DarkBlueSemiBold = TextStyle(
    fontSize: FontSizeManager.s18,
    color: ColorManager.lightBlack,
    fontWeight: FontWeightManager.semiBold,
    letterSpacing: 1.2,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font18GrayRegular = TextStyle(
    fontSize: FontSizeManager.s18,
    fontWeight: FontWeightManager.regular,
    color: ColorManager.gray,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font20OriginalWhiteSemiBold = TextStyle(
    fontSize: FontSizeManager.s20,
    color: ColorManager.originalWhite,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font32DarkBlueBold = TextStyle(
    fontSize: FontSizeManager.s32,
    color: ColorManager.lightBlack,
    fontFamily: ConstVariableManager.fontFamily,
    fontWeight: FontWeightManager.bold,
  );

  static TextStyle font34DarkBlueRegular = TextStyle(
    fontSize: FontSizeManager.s34,
    color: ColorManager.lightBlack,
    fontFamily: ConstVariableManager.fontFamily,
    fontWeight: FontWeightManager.regular,
  );

  static TextStyle font34PurpleBold = TextStyle(
    fontSize: FontSizeManager.s34,
    color: ColorManager.purple,
    fontFamily: ConstVariableManager.fontFamily,
    fontWeight: FontWeightManager.bold,
  );

  static TextStyle font36DarkBlueSemiBold = TextStyle(
    fontSize: FontSizeManager.s36,
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.lightBlack,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font36PurpleSemiBold = TextStyle(
    fontSize: FontSizeManager.s36,
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.purple,
    fontFamily: ConstVariableManager.fontFamily,
  );

  static TextStyle font42DarkBlueExtraBold = TextStyle(
    fontSize: FontSizeManager.s42,
    color: ColorManager.lightBlack,
    fontWeight: FontWeightManager.extraBold,
    fontFamily: ConstVariableManager.fontFamily,
  );
}
