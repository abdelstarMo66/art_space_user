import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0),
        child: GestureDetector(
          onTap: () => context.pushNamed(Routes.search),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.lighterGray,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.purple.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 14.0,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.icSearch,
                    width: 26.0,
                    height: 26.0,
                    colorFilter:
                        const ColorFilter.mode(ColorManager.gray, BlendMode.srcIn),
                  ),
                  horizontalSpace(8.0),
                  Text(
                    "Search",
                    style: TextStyleManager.font16GrayRegular,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
