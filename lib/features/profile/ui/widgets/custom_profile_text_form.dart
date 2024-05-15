import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theming/text_style_manager.dart';

class CustomProfileTextForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final bool enabled;

  const CustomProfileTextForm({
    super.key,
    required this.controller,
    required this.type,
    required this.label,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onLongPress: !enabled
            ? () async {
                await Clipboard.setData(ClipboardData(text: controller.text));
              }
            : null,
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          maxLines: 1,
          enabled: enabled,
          style: TextStyleManager.font16DarkPurpleBold,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            icon: Text(label, style: TextStyleManager.font20LightBlackBold),
          ),
        ),
      ),
    );
  }
}
