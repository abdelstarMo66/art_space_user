import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:art_space_user/features/auth/ui/widgets/custom_pin_code_text_Field.dart';
import 'package:art_space_user/features/auth/ui/widgets/resend_otp_verify_email.dart';
import 'package:art_space_user/features/auth/ui/widgets/verify_email_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_style_manager.dart';

class OTPVerifyAccount extends StatelessWidget {
  final String email;

  const OTPVerifyAccount({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: TextStyleManager.font36LightBlackSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter The Verify Code We Just Sent\nOn Your Email",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              CustomPinCodeTextField(
                formKey: context.read<RegisterCubit>().registerFormKey,
                controller: context.read<RegisterCubit>().otpController,
              ),
              verticalSpace(60.0),
              VerifyEmailBlocListener(email: email),
              verticalSpace(40.0),
              ResendOTPVerifyEmail(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
