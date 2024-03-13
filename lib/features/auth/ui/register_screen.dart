import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/features/auth/ui/widgets/register_form.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/app_text_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30.0),
              Text(
                "Register",
                style: TextStyleManager.font36DarkBlueSemiBold,
              ),
              Text(
                "Welcome To You In Art Space",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              const RegisterForm(),
              verticalSpace(38.0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "By Continuing, You agree to Our",
                        style: TextStyleManager.font14DarkBlueMedium),
                    TextSpan(
                        text: " Terms of Service",
                        style: TextStyleManager.font14DarkPurpleSemiBold),
                  ],
                ),
              ),
              verticalSpace(12.0),
              AppTextButton(
                buttonText: "Register",
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () =>
                    context.pushReplacementNamed(Routes.otpVerifyAccount),
              ),
              verticalSpace(24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyleManager.font14DarkBlueMedium,
                  ),
                  TextButton(
                    onPressed: () => context.pushReplacementNamed(Routes.login),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      ' Login',
                      style: TextStyleManager.font16DarkPurpleBold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
