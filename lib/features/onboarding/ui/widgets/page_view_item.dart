import 'package:art_space_user/features/onboarding/models/page_view_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';

class PageViewItem extends StatelessWidget {
  final PageViewItemModel item;

  const PageViewItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: TextStyleManager.font34LightBlackRegular,
        ),
        verticalSpace(20.0),
        AspectRatio(
          aspectRatio: 1,
          child: SvgPicture.asset(item.image, fit: BoxFit.fill),
        ),
      ],
    );
  }
}
