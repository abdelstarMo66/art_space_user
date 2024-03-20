import 'package:flutter/material.dart';

import '../theming/color_manager.dart';
import '../theming/text_style_manager.dart';

class CustomNonBorderTextForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String hint;

  const CustomNonBorderTextForm({
    super.key,
    required this.controller,
    required this.type,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          hintText: hint,
          hintStyle: TextStyleManager.font18OriginalBlackSemiBold,
          fillColor: ColorManager.lighterGray,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
