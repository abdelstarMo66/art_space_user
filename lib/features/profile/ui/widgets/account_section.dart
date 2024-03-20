import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(Routes.myProfile),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/smiley-handsome-man-posing_23-2148911841.jpg?w=740&t=st=1710457738~exp=1710458338~hmac=8e7fa56e15d09e0ed714fe7f3ca66c110f41aa049a673de624d74779d860ebea",
                ),
              ),
              horizontalSpace(12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Muhammed Ahmed",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleManager.font18LightBlackBold,
                    ),
                    verticalSpace(4.0),
                    Text(
                      "mohamedabdelstar30@gmail.com",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleManager.font14LightGrayMedium,
                    ),
                    verticalSpace(8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 30.0,
          color: ColorManager.lightGray,
          thickness: 0.2,
        ),
      ],
    );
  }
}
