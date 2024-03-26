import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/ui/widgets/forget_password_bloc_listener.dart';
import 'package:art_space_user/features/auth/ui/widgets/form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_regex.dart';
import '../../../core/theming/text_style_manager.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.read<ForgetPasswordCubit>().emailController.text);
    print(context.read<ForgetPasswordCubit>().passwordController.text);
    print(context.read<ForgetPasswordCubit>().otpController.text);
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
                style: TextStyleManager.font36LightBlackSemiBold,
              ),
              verticalSpace(8.0),
              Text(
                "Enter your Email Address to get\nthe reset code",
                style: TextStyleManager.font18GrayRegular,
              ),
              verticalSpace(50.0),
              Form(
                key: context.read<ForgetPasswordCubit>().forgetPasswordFormKey,
                child: FormItem(
                  label: "Email Address",
                  controller:
                      context.read<ForgetPasswordCubit>().emailController,
                  hintText: "Enter Your Email",
                  validator: (value) => emailValidation(value),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              verticalSpace(40.0),
              const ForgetPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  String? emailValidation(email) {
    if (email == null || email.isEmpty || !AppRegex.isEmailValid(email)) {
      return "Please Enter a valid email";
    } else {
      return null;
    }
  }
}
