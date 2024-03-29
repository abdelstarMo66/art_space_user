import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';

class AddAddressBlocListener extends StatelessWidget {
  const AddAddressBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listenWhen: (previous, current) =>
          current is AddAddressLoadingState ||
          current is AddAddressSuccessState ||
          current is AddAddressFailureState,
      listener: (context, state) {
        if (state is AddAddressSuccessState) {
          context.read<ProfileCubit>().emitGetProfileState();

          context.pop();
          context.read<ProfileCubit>().clearAddAddressControllers();
          AnimatedSnackBar.material(
            state.addAddressResponse.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
        if (state is AddAddressFailureState) {
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
          buttonText: "Add Address",
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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: ColorManager.originalWhite, size: 35.0),
          ),
        ),
        crossFadeState: state is AddAddressLoadingState
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
        validateThenDoAddress(context.read<ProfileCubit>());
        context.pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Add New Address",
        style: TextStyleManager.font20LightBlackBold,
      ),
      content: Text(
        "Are you sure you want to Add This Address?",
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

  void validateThenDoAddress(ProfileCubit cubit) {
    if (cubit.addAddressFormKey.currentState!.validate()) {
      cubit.emitAddAddressState();
    }
  }
}
