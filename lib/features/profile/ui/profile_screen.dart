import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/features/profile/ui/widgets/about_section.dart';
import 'package:art_space_user/features/profile/ui/widgets/account_section.dart';
import 'package:art_space_user/features/profile/ui/widgets/content_and_activity_section.dart';
import 'package:art_space_user/features/profile/ui/widgets/support_section.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12.0),
            const AccountSection(),
            const ContentAndActivitySection(),
            const SupportSection(),
            const AboutSection(),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: ColorManager.dartPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "ⓒ 2024 Art-Space, Design by Muhamed",
                textAlign: TextAlign.center,
                style: TextStyleManager.font16DarkPurpleBold,
              ),
            ),
            verticalSpace(80.0),
          ],
        ),
      ),
    );
  }
}
