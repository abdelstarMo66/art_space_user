import 'dart:async';

import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/text_style_manager.dart';

class ResendOTP extends StatefulWidget {
  const ResendOTP({super.key});

  @override
  State<ResendOTP> createState() => _ResendOTPState();
}

class _ResendOTPState extends State<ResendOTP> {
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
                    timer.cancel();
                    time = 30;
                    decreaseTimer();
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
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
