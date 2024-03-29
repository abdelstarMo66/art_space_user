import 'package:art_space_user/core/helpers/app_regex.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/custom_non_border_text_form.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:art_space_user/features/profile/ui/widgets/change_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/text_style_manager.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Change Password",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
        onTap: () {
          context.pop();
          context.read<ProfileCubit>().clearChangePasswordControllers();
        },
      ),
      bottomSheet: Container(
        color: ColorManager.originalWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: const ChangePasswordBlocListener(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (context.read<ProfileCubit>().profile == null) {
                return AppCustomShimmer(
                  child: Column(
                    children: [
                      for (int i = 0; i < 3; i++) ...[
                        Container(
                          height: 60.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ]
                    ],
                  ),
                );
              } else {
                return Form(
                  key: context.read<ProfileCubit>().changePasswordFormKey,
                  child: Column(
                    children: [
                      CustomNonBorderTextForm(
                        controller: context
                            .read<ProfileCubit>()
                            .currentPasswordController,
                        type: TextInputType.text,
                        hint: "Enter old password",
                        obscure: true,
                        validator: (value) => oldPasswordValidation(value),
                      ),
                      CustomNonBorderTextForm(
                        controller:
                            context.read<ProfileCubit>().newPasswordController,
                        type: TextInputType.text,
                        hint: "Enter new password",
                        obscure: true,
                        validator: (value) => newPasswordValidation(value),
                      ),
                      CustomNonBorderTextForm(
                        controller: context
                            .read<ProfileCubit>()
                            .confirmNewPasswordController,
                        type: TextInputType.text,
                        hint: "Confirm new password",
                        obscure: true,
                        validator: (value) => confirmPasswordValidation(
                          value,
                          context
                              .read<ProfileCubit>()
                              .newPasswordController
                              .text,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  String? oldPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else {
      return null;
    }
  }

  String? newPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else if (password.length < 8) {
      return "password too short, minimum 8 characters";
    } else if (!AppRegex.isPasswordValid(password)) {
      return "Please Enter a strong password";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? confirmPassword, String password) {
    if (password != confirmPassword) {
      return "password confirmation not match password";
    } else {
      return null;
    }
  }
}
