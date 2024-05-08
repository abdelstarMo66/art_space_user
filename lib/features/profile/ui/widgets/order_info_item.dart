import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  final String title, subTitle;

  const OrderInfoItem({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title: ",
            style: TextStyleManager.font20DarkPurpleSemiBold,
          ),
          TextSpan(
            text: subTitle,
            style: TextStyleManager.font18GrayRegular,
          ),
        ],
      ),
    );
  }
}
