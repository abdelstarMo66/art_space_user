import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/profile/ui/widgets/profile_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class ContentAndActivitySection extends StatelessWidget {
  const ContentAndActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Content & Activity",
          style: TextStyleManager.font14LighterBlackRegular,
        ),
        ProfileItem(
          icon: AssetsManager.icOrder,
          title: "Your Orders",
          onTap: () => context.pushNamed(Routes.yourOrder),
        ),
        ProfileItem(
          icon: AssetsManager.icAddress,
          title: "Addresses",
          onTap: () => context.pushNamed(Routes.addresses),
        ),
        ProfileItem(
          icon: AssetsManager.icLock,
          title: "Change Password",
          onTap: () => context.pushNamed(Routes.changePassword),
        ),
        ProfileItem(
          icon: AssetsManager.icLanguage,
          title: "App Language",
          onTap: () {},
        ),
        ProfileItem(
          icon: AssetsManager.icAmount,
          title: "Currency",
          onTap: () {},
        ),
        ProfileItem(
          icon: AssetsManager.icDarkMode,
          title: "Mode",
          onTap: () {

          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            height: 20.0,
            color: ColorManager.lightGray,
            thickness: 0.2,
          ),
        ),
      ],
    );
  }
}
