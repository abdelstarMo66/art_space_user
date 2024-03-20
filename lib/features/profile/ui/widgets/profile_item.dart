import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/icon_broken.dart';
import '../../../../core/theming/text_style_manager.dart';

class ProfileItem extends StatelessWidget {
  final String title, icon;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.originalWhite,
        foregroundColor: ColorManager.dartPurple.withOpacity(0.5),
        shadowColor: ColorManager.transparent,
        surfaceTintColor: ColorManager.transparent,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 28.0,
            height: 28.0,
            colorFilter: const ColorFilter.mode(ColorManager.dartPurple, BlendMode.srcIn),
          ),
          horizontalSpace(8.0),
          Text(
            title,
            style: TextStyleManager.font18LightBlackSemiBold,
          ),
          const Spacer(),
          SvgPicture.asset(
            AssetsManager.icArrowRight,
            width: 36.0,
            height: 36.0,
            colorFilter: const ColorFilter.mode(ColorManager.dartPurple, BlendMode.srcIn),
          )
        ],
      ),
    );
  }
}
