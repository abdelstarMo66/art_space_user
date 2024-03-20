import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/custom_non_border_text_form.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/text_style_manager.dart';

class ChangePasswordScreen extends StatelessWidget {
  static TextEditingController oldPassword = TextEditingController();
  static TextEditingController newPassword = TextEditingController();
  static TextEditingController confirmNewPassword = TextEditingController();


  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Change Password",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.originalWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: AppTextButton(
          buttonText: "Change Password",
          borderRadius: 14.0,
          buttonHeight: 55.0,
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomNonBorderTextForm(
                controller: oldPassword,
                type: TextInputType.text,
                hint: "Enter old password",
              ),
              CustomNonBorderTextForm(
                controller: newPassword,
                type: TextInputType.text,
                hint: "Enter new password",
              ),
              CustomNonBorderTextForm(
                controller: confirmNewPassword,
                type: TextInputType.text,
                hint: "Confirm new password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
