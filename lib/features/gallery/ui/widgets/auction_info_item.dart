import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/font_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';

class AuctionInfoItem extends StatelessWidget {
  final String title, subTitle;

  const AuctionInfoItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title: ",
            style: TextStyleManager.font22LightBlackBold
                .copyWith(color: ColorManager.purple),
          ),
          TextSpan(
            text: subTitle,
            style: TextStyleManager.font20LightBlackBold.copyWith(
              fontWeight: FontWeightManager.regular,
            ),
          ),
        ],
      ),
    );
  }
}
