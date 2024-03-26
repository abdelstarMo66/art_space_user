import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  final String email;
  const ResetPasswordBlocListener({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoadingState ||
          current is ResetPasswordSuccessState ||
          current is ResetPasswordFailureState,
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.bottomNavigationBar,
              predicate: (Route<dynamic> route) => false);
          AnimatedSnackBar.material(
            state.response.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
        if (state is ResetPasswordFailureState) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
      },
      builder: (context, state) => AnimatedCrossFade(
        firstChild: AppTextButton(
          buttonText: "Reset Password",
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          onPressed: () =>
              validateThenDoResetPassword(context.read<ForgetPasswordCubit>()),
        ),
        secondChild: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: ColorManager.purple,
            borderRadius: BorderRadius.circular(14.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: ColorManager.originalWhite, size: 35.0),
          ),
        ),
        crossFadeState: state is ResetPasswordLoadingState
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  void validateThenDoResetPassword(ForgetPasswordCubit cubit) {
    if (cubit.resetPassFormKey.currentState!.validate()) {
      cubit.emitResetPasswordState(email: email);
    }
  }
}
