import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manager.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String?) validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function()? editAction;
  final String? prefixText;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.backGroundColor,
    this.controller,
    required this.validator,
    required this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.editAction,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onEditingComplete: editAction,
      decoration: InputDecoration(
        prefixText: prefixText,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(22.0),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.purple,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(22.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        fillColor: backGroundColor ?? ColorManager.moreLightGray,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyleManager.font14LightGrayMedium,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyleManager.font14LightBlackMedium,
    );
  }
}
