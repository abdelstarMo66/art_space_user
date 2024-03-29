import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'custom_profile_text_form.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool enabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<ProfileCubit, ProfileStates>(
          listenWhen: (previous, current) =>
              current is UpdateProfileLoadingState ||
              current is UpdateProfileSuccessState ||
              current is UpdateProfileFailureState,
          listener: (context, state) {
            if (state is UpdateProfileSuccessState) {
              context.read<ProfileCubit>().emitGetProfileState();

              setState(() {
                enabled = !enabled;
              });

              AnimatedSnackBar.material(
                state.updateProfileResponse.message,
                type: AnimatedSnackBarType.success,
                animationCurve: Curves.fastEaseInToSlowEaseOut,
                mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              ).show(context);
            }
            if (state is UpdateProfileFailureState) {
              AnimatedSnackBar.material(
                state.message,
                type: AnimatedSnackBarType.error,
                animationCurve: Curves.fastEaseInToSlowEaseOut,
                mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              ).show(context);
            }
          },
          builder: (context, state) {
            return Form(
              key: context.read<ProfileCubit>().profileFormKey,
              child: Column(
                children: [
                  CustomProfileTextForm(
                    controller: context.read<ProfileCubit>().emailController,
                    type: TextInputType.emailAddress,
                    label: "Email",
                  ),
                  CustomProfileTextForm(
                    controller: context.read<ProfileCubit>().nameController,
                    type: TextInputType.name,
                    label: "Name",
                    enabled: enabled,
                  ),
                  CustomProfileTextForm(
                    controller: context.read<ProfileCubit>().phoneController,
                    type: TextInputType.phone,
                    label: "Phone",
                    enabled: enabled,
                  ),
                  verticalSpace(22.0),
                  AnimatedCrossFade(
                    firstChild: AppTextButton(
                      buttonText: "Edit",
                      buttonWidth: 220.w,
                      textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                      onPressed: () {
                        setState(() {
                          enabled = !enabled;
                        });
                      },
                    ),
                    secondChild: state is UpdateProfileLoadingState
                        ? Container(
                            height: 45.0,
                            width: 220.w,
                            decoration: BoxDecoration(
                              color: ColorManager.purple,
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            child: Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: ColorManager.originalWhite,
                                  size: 35.0),
                            ),
                          )
                        : AppTextButton(
                            buttonText: "Save",
                            buttonWidth: 220.w,
                            textStyle:
                                TextStyleManager.font20OriginalWhiteSemiBold,
                            onPressed: () {
                              validateThenDoUpdateProfile(
                                  context.read<ProfileCubit>());
                            },
                          ),
                    crossFadeState: enabled
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 400),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void validateThenDoUpdateProfile(ProfileCubit cubit) {
    if (cubit.profileFormKey.currentState!.validate()) {
      cubit.emitUpdateProfileState();
    }
  }
}
