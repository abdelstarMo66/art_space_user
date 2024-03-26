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

class VerifyCodeBlocListener extends StatelessWidget {
  final String email;

  const VerifyCodeBlocListener({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          current is VerifyCodeLoadingState ||
          current is VerifyCodeSuccessState ||
          current is VerifyCodeFailureState,
      listener: (context, state) {
        if (state is VerifyCodeSuccessState) {
          context.pushNamedAndRemoveUntil(
            Routes.resetPassword,
            predicate: (Route<dynamic> route) => false,
            arguments: email,
          );
          AnimatedSnackBar.material(
            state.response.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
        if (state is VerifyCodeFailureState) {
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
          buttonText: "Verify",
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          onPressed: () =>
              validateThenDoVerifyCode(context.read<ForgetPasswordCubit>()),
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
        crossFadeState: state is VerifyCodeLoadingState
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  void validateThenDoVerifyCode(ForgetPasswordCubit cubit) {
    if (cubit.verifyFormKey.currentState!.validate()) {
      cubit.emitVerifyCodeState(email: email);
    }
  }
}
