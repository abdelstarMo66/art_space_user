import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class ArtistSearchItem extends StatelessWidget {
  const ArtistSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: ColorManager.originalWhite,
          borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.blue,
          ),
          horizontalSpace(8.0),
          Text("Artist Title 1", style: TextStyleManager.font24PurpleSemiBold)
        ],
      ),
    );
  }
}
