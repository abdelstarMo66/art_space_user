import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class FormItem extends StatelessWidget {
  final String label;
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

  const FormItem({
    super.key,
    required this.label,
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label :",
          style: TextStyleManager.font16DarkPurpleBold,
        ),
        verticalSpace(2.0),
        AppTextFormField(
          controller: controller,
          validator: validator,
          hintText: hintText,
          hintStyle: hintStyle,
          inputTextStyle: inputTextStyle,
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          isObscureText: isObscureText,
          suffixIcon: suffixIcon,
          backgroundColor: backgroundColor,
          backGroundColor: backGroundColor,
          contentPadding: contentPadding,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
