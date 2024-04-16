import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class ArtworkDetailsTypeItem extends StatelessWidget {
  final String material, style, subject, size;

  const ArtworkDetailsTypeItem({
    super.key,
    required this.material,
    required this.style,
    required this.subject,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        const List<String> titles = [
          "Material",
          "Style",
          "Subject",
          "Dimensions"
        ];
        List<String> values = [material, style, subject, "$size cm"];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 4.0,
              minVerticalPadding: 0.0,
              leading: CircleAvatar(
                backgroundColor: ColorManager.dartPurple,
                radius: 10.0,
                child: SvgPicture.asset(
                  AssetsManager.icCheck,
                ),
              ),
              title: Text(
                titles[index],
                style: TextStyleManager.font20LightBlackBold,
              ),
            ),
            Text(
              "     ${values[index]}",
              style: TextStyleManager.font18LightBlackSemiBold,
            )
          ],
        );
      },
      separatorBuilder: (context, index) => verticalSpace(12.0),
      itemCount: 4,
    );
  }
}
