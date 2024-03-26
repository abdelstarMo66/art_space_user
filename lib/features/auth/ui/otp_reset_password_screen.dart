import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/ui/widgets/custom_pin_code_text_Field.dart';
import 'package:art_space_user/features/auth/ui/widgets/resend_otp_verify_code.dart';
import 'package:art_space_user/features/auth/ui/widgets/verify_code_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_style_manager.dart';

class OtpResetPassword extends StatelessWidget {
  final String email;

  const OtpResetPassword({super.key, required this.email});

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
              CustomPinCodeTextField(
                formKey: context.read<ForgetPasswordCubit>().verifyFormKey,
                controller: context.read<ForgetPasswordCubit>().otpController,
              ),
              verticalSpace(60.0),
              VerifyCodeBlocListener(email: email),
              verticalSpace(40.0),
              // TODO: cubit
              ResendOTPVerifyCode(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
