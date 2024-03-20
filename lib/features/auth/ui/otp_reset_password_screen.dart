import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/auth/ui/widgets/custom_pin_code_text_Field.dart';
import 'package:art_space_user/features/auth/ui/widgets/resend_otp.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/app_text_button.dart';

class OtpResetPassword extends StatelessWidget {
  const OtpResetPassword({super.key});

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
              Text(
                "OTP Verify",
                style: TextStyleManager.font36LightBlackSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter The Reset Code We Just Sent\nOn Your Email",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              const CustomPinCodeTextField(),
              verticalSpace(60.0),
              AppTextButton(
                buttonText: "Verify",
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () => context.pushNamedAndRemoveUntil(
                    Routes.resetPassword,
                    predicate: (Route<dynamic> route) => false),
              ),
              verticalSpace(40.0),
              const ResendOTP(),
            ],
          ),
        ),
      ),
    );
  }
}
