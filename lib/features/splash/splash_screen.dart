import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';

import '../../core/networking/local/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late CrossFadeState state;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    state = CrossFadeState.showFirst;
    afterAnimation();
  }

  void afterAnimation() =>
      Future.delayed(const Duration(milliseconds: 2000), () {
        animationController.forward();

        setState(() {
          state = CrossFadeState.showSecond;
        });

        Future.delayed(const Duration(seconds: 2), () {
          bool? isOnboarding =
              SharedPreferencesManager.getData(key: PrefsManager.onboarding);


          if (isOnboarding != null) {
            context.pushReplacementNamed(Routes.login);
          } else {
            context.pushReplacementNamed(Routes.onboarding);
          }

        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.purple,
      body: CircularRevealAnimation(
        animation: animation,
        centerAlignment: Alignment.center,
        minRadius: 85,
        child: Container(
          color: Colors.white,
          child: Center(
            child: AnimatedCrossFade(
              firstChild: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Hi ",
                    style: TextStyleManager.font42LightBlackExtraBold,
                  ),
                  TextSpan(
                    text: "!",
                    style: TextStyleManager.font42LightBlackExtraBold,
                  ),
                ]),
              ),
              secondChild: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Art ",
                    style: TextStyleManager.font34PurpleBold,
                  ),
                  TextSpan(
                    text: "Space",
                    style: TextStyleManager.font32LightBlackBold,
                  ),
                ]),
              ),
              crossFadeState: state,
              duration: const Duration(milliseconds: 800),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
