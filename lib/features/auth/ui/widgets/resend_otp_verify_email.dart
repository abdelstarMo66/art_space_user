import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:art_space_user/features/auth/logic/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/text_style_manager.dart';

class ResendOTPVerifyEmail extends StatefulWidget {
  final String email;

  const ResendOTPVerifyEmail({super.key, required this.email});

  @override
  State<ResendOTPVerifyEmail> createState() => _ResendOTPVerifyEmailState();
}

class _ResendOTPVerifyEmailState extends State<ResendOTPVerifyEmail> {
  int time = 30;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    decreaseTimer();
  }

  void decreaseTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is ResendCodeSuccessState) {
          timer.cancel();
          time = 30;
          decreaseTimer();
          AnimatedSnackBar.material(
            state.response.message,
            type: AnimatedSnackBarType.success,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
        if (state is ResendCodeFailureState) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
      },
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Resend OTP In ${time}s",
                style: TextStyleManager.font14LightBlackMedium,
              ),
              verticalSpace(8.0),
              TextButton(
                onPressed: time <= 0
                    ? () {
                        context
                            .read<RegisterCubit>()
                            .emitResendCodeState(email: widget.email);
                      }
                    : null,
                child: Text(
                  "Resend OTP",
                  style: TextStyleManager.font16DarkPurpleBold.copyWith(
                    color: time <= 0
                        ? ColorManager.dartPurple
                        : ColorManager.lightGray,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}