import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/features/auth/ui/widgets/custom_pin_code_text_Field.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/resend_otp.dart';

class OTPVerifyAccount extends StatelessWidget {
  const OTPVerifyAccount({super.key});

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
                "OTP Verify",
                style: TextStyleManager.font36DarkBlueSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter The Verify Code We Just Sent\nOn Your Email",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              const CustomPinCodeTextField(),
              verticalSpace(60.0),
              AppTextButton(
                buttonText: "Verify",
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () =>
                    context.pushReplacementNamed(Routes.congratulation),
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