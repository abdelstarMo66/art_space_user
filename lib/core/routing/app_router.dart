import 'package:art_space_user/core/routing/animation_route.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/features/auth/ui/forget_password_screen.dart';
import 'package:art_space_user/features/auth/ui/login_screen.dart';
import 'package:art_space_user/features/auth/ui/otp_reset_password_screen.dart';
import 'package:art_space_user/features/auth/ui/register_screen.dart';
import 'package:art_space_user/features/auth/ui/reset_password_screen.dart';
import 'package:art_space_user/features/home/ui/home_screen.dart';
import 'package:art_space_user/features/onboarding/ui/onboarding_screen.dart';
import 'package:art_space_user/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/ui/congratulation_screen.dart';
import '../../features/auth/ui/otp_verify_account_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return AnimationRoute(page: const SplashScreen());
      case Routes.onboarding:
        return AnimationRoute(page: const OnboardingScreen());
      case Routes.login:
        return AnimationRoute(page: const LoginScreen());
      case Routes.forgetPassword:
        return AnimationRoute(page: const ForgetPasswordScreen());
      case Routes.otpResetPassword:
        return AnimationRoute(page: const OtpResetPassword());
      case Routes.resetPassword:
        return AnimationRoute(page: const ResetPassword());
      case Routes.register:
        return AnimationRoute(page: const RegisterScreen());
      case Routes.otpVerifyAccount:
        return AnimationRoute(page: const OTPVerifyAccount());
      case Routes.congratulation:
        return AnimationRoute(page: const CongratulationScreen());
      case Routes.home:
        return AnimationRoute(page: const HomeScreen());
      default:
        return unDefinitionRoute(settings);
    }
  }

  AnimationRoute unDefinitionRoute(RouteSettings settings) => AnimationRoute(
        page: Scaffold(
          body: Center(
            child: Text('no route defined for this page ${settings.name}'),
          ),
        ),
      );
}
