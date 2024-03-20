import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/features/auth/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Login",
                style: TextStyleManager.font36LightBlackSemiBold,
              ),
              Text(
                "Welcome Back In Art Space",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              const LoginForm(),
              verticalSpace(18.0),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () => context.pushNamed(Routes.forgetPassword),
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyleManager.font14DarkPurpleSemiBold,
                  ),
                ),
              ),
              verticalSpace(38.0),
              AppTextButton(
                buttonText: "Login",
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () => context.pushNamedAndRemoveUntil(Routes.bottomNavigationBar,
                    predicate: (Route<dynamic> route) => false),
              ),
              verticalSpace(24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyleManager.font14LightBlackMedium,
                  ),
                  TextButton(
                    onPressed: () =>
                        context.pushReplacementNamed(Routes.register),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      ' Sign Up',
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
