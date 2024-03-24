import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class NotificationItem extends StatelessWidget {
  final bool isRead;

  const NotificationItem({super.key, this.isRead = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
          decoration: BoxDecoration(
              color: isRead
                  ? ColorManager.originalWhite
                  : ColorManager.lighterGray,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: ColorManager.originalWhite)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notification Title",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleManager.font18LightBlackSemiBold,
              ),
              Text(
                "Notification Message Notification Message Notification Message Notification Message",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleManager.font16GrayRegular,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  "05:23:00, 24/03/2024",
                  style: TextStyleManager.font14LighterBlackRegular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
