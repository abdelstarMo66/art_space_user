import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/features/profile/ui/widgets/profile_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Support", style: TextStyleManager.font14LighterBlackRegular),
        ProfileItem(
          icon: AssetsManager.icTechnicalSupport,
          title: "Report a Problem",
          onTap: () => context.pushNamed(Routes.reportProblem),
        ),
        ProfileItem(
          icon: AssetsManager.icInfo,
          title: "Help Center",
          onTap: () => context.pushNamed(Routes.helpCenter),
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
