import 'package:art_space_user/features/auth/ui/widgets/reset_password_bloc_listener.dart';
import 'package:art_space_user/features/auth/ui/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_style_manager.dart';

class ResetPassword extends StatelessWidget {
  final String email;

  const ResetPassword({super.key, required this.email});

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
                "Reset Password",
                style: TextStyleManager.font36LightBlackSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter your New Password Twice Below To Reset a New Password",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              const ResetPasswordForm(),
              verticalSpace(40.0),
              ResetPasswordBlocListener(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
