import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/features/profile/ui/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About", style: TextStyleManager.font14LighterBlackRegular),
        ProfileItem(
          icon: AssetsManager.icGuideline,
          title: "Community Guidelines",
          onTap: () => context.pushNamed(Routes.communityGuidelines),
        ),
        ProfileItem(
          icon: AssetsManager.icTerms,
          title: "Terms of Use",
          onTap: () => context.pushNamed(Routes.termsOfUse),
        ),
        ElevatedButton(
          onPressed: () {
            // logout of app => reset all instance inside getIt => register new instance from getIt => navigate
            SharedPreferencesManager.removeData(key: PrefsManager.token)
                .then((_) => getIt.reset().then((_) {
                      setupGetIt().then((value) =>
                          context.pushNamedAndRemoveUntil(Routes.login,
                              predicate: (Route<dynamic> route) => false));
                    }));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.originalWhite,
              shadowColor: ColorManager.transparent,
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(horizontal: 8.0)),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsManager.icLogOut,
                width: 28.0,
                height: 28.0,
              ),
              horizontalSpace(8.0),
              Text(
                "Logout",
                style: TextStyleManager.font18LightBlackSemiBold,
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
