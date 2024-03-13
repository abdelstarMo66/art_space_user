import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/auth/ui/widgets/form_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/app_text_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30.0),
              Text(
                "Forget Password?",
                style: TextStyleManager.font36DarkBlueSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter your Email Address to get\nthe reset code",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              FormItem(
                label: "Email Address",
                controller: emailController,
                hintText: "Enter Your Email",
                validator: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpace(40.0),
              AppTextButton(
                buttonText: "Password Reset",
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () =>
                    context.pushReplacementNamed(Routes.otpResetPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
