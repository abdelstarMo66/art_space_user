import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        opacity = 1.0;
      });

      Future.delayed(
          const Duration(seconds: 3),
          () => context.pushNamedAndRemoveUntil(Routes.bottomNavigationBar,
              predicate: (Route<dynamic> route) => false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/img_congratulation.png",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 500.h,
            right: 55.w,
            left: 55.5,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: opacity,
              child: Column(
                children: [
                  Text("CONGRATS",
                      style: TextStyleManager.font36PurpleSemiBold),
                  Text("Thank You For Signing Up 🥳",
                      style: TextStyleManager.font18LightBlackSemiBold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
