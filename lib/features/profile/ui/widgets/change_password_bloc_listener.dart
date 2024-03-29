import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class ChangePasswordBlocListener extends StatelessWidget {
  const ChangePasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listenWhen: (previous, current) =>
      current is ChangePasswordLoadingState ||
          current is ChangePasswordSuccessState ||
          current is ChangePasswordFailureState,
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          SharedPreferencesManager.removeData(key: PrefsManager.token);
          SharedPreferencesManager.saveData(
            key: PrefsManager.token,
            value: state.changePasswordResponse.data.token,
          );
          context.read<ProfileCubit>().emitGetProfileState();

          context.pop();
          AnimatedSnackBar.material(
            state.changePasswordResponse.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
        if (state is ChangePasswordFailureState) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
      },
      builder: (context, state) =>
          AnimatedCrossFade(
            firstChild: AppTextButton(
              buttonText: "Change Password",
              borderRadius: 14.0,
              buttonHeight: 55.0,
              textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
              onPressed: () => showAlertDialog(context),
            ),
            secondChild: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: ColorManager.purple,
                borderRadius: BorderRadius.circular(14.0),
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 12.0),
              child: Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: ColorManager.originalWhite, size: 35.0),
              ),
            ),
            crossFadeState: state is ChangePasswordLoadingState
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 700),
          ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyleManager.font16DarkPurpleMedium,
      ),
      onPressed: () {
        context.pop();
      },
    );

    Widget continueButton = TextButton(
      child: Text(
        "Continue",
        style: TextStyleManager.font16DarkPurpleMedium,
      ),
      onPressed: () {
        validateThenDoChangePassword(context.read<ProfileCubit>());
        context.pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Change Password",
        style: TextStyleManager.font20LightBlackBold,
      ),
      content: Text(
        "Are you sure you want to change your password?",
        style: TextStyleManager.font14LightBlackMedium,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
      backgroundColor: ColorManager.originalWhite,
      elevation: 0.0,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void validateThenDoChangePassword(ProfileCubit cubit) {
    if (cubit.changePasswordFormKey.currentState!.validate()) {
      cubit.emitChangePasswordState();
    }
  }
}
