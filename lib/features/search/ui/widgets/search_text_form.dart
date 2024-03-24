import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class SearchTextForm extends StatelessWidget {
  static TextEditingController searchController = TextEditingController();

  const SearchTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      keyboardType: TextInputType.text,
      style: TextStyleManager.font16LighterBlackRegular,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: "Enter Search Keyword",
        hintStyle: TextStyleManager.font16GrayRegular,
        fillColor: ColorManager.originalWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 16.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: ColorManager.purple,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
