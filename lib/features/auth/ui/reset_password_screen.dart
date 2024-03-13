import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/features/auth/ui/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/app_text_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(50.0),
              Text(
                "Reset Password",
                style: TextStyleManager.font36DarkBlueSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter your New Password Twice Below To Reset a New Password",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              const ResetPasswordForm(),
              verticalSpace(40.0),
              AppTextButton(
                buttonText: "Reset Password",
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () => context.pushNamedAndRemoveUntil(Routes.home,
                    predicate: (Route<dynamic> route) => false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
