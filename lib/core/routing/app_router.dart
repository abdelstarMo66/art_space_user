import 'package:art_space_user/core/app_cubit/app_cubit.dart';
import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/routing/animation_route.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/features/artworks/ui/artwork_details_screen.dart';
import 'package:art_space_user/features/artworks/ui/artworks_screen.dart';
import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:art_space_user/features/auth/logic/login/login_cubit.dart';
import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:art_space_user/features/auth/ui/forget_password_screen.dart';
import 'package:art_space_user/features/auth/ui/login_screen.dart';
import 'package:art_space_user/features/auth/ui/otp_reset_password_screen.dart';
import 'package:art_space_user/features/auth/ui/register_screen.dart';
import 'package:art_space_user/features/auth/ui/reset_password_screen.dart';
import 'package:art_space_user/features/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:art_space_user/features/exhibitions/ui/exhibition_details_screen.dart';
import 'package:art_space_user/features/exhibitions/ui/exhibitions_screen.dart';
import 'package:art_space_user/features/notification/ui/notification_screen.dart';
import 'package:art_space_user/features/onboarding/ui/onboarding_screen.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/ui/add_address_screen.dart';
import 'package:art_space_user/features/profile/ui/addresses_screen.dart';
import 'package:art_space_user/features/profile/ui/change_password_screen.dart';
import 'package:art_space_user/features/profile/ui/community_guidelines_screen.dart';
import 'package:art_space_user/features/profile/ui/help_center_screen.dart';
import 'package:art_space_user/features/profile/ui/my_profile_screen.dart';
import 'package:art_space_user/features/profile/ui/report_problem_screen.dart';
import 'package:art_space_user/features/profile/ui/terms_of_use_screen.dart';
import 'package:art_space_user/features/profile/ui/your_order_screen.dart';
import 'package:art_space_user/features/search/logic/search_cubit.dart';
import 'package:art_space_user/features/search/ui/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/ui/congratulation_screen.dart';
import '../../features/auth/ui/otp_verify_account_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Welcome
      case Routes.splash:
        return AnimationRoute(page: const SplashScreen());
      case Routes.onboarding:
        return AnimationRoute(page: const OnboardingScreen());

      // Authorization
      case Routes.login:
        return AnimationRoute(
          page: BlocProvider(
            create: (BuildContext context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPassword:
        return AnimationRoute(
          page: BlocProvider(
            create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.otpResetPassword:
        return AnimationRoute(
          page: BlocProvider(
            create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
            child: OtpResetPassword(email: settings.arguments as String),
          ),
        );
      case Routes.resetPassword:
        return AnimationRoute(
          page: BlocProvider(
            create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
            child: ResetPassword(email: settings.arguments as String),
          ),
        );
      case Routes.register:
        return AnimationRoute(
          page: BlocProvider(
            create: (BuildContext context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.otpVerifyAccount:
        return AnimationRoute(
          page: BlocProvider(
            create: (BuildContext context) => getIt<RegisterCubit>(),
            child: OTPVerifyAccount(email: settings.arguments as String),
          ),
        );
      case Routes.congratulation:
        return AnimationRoute(page: const CongratulationScreen());

      // BottomNavBar
      case Routes.bottomNavigationBar:
        return AnimationRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<AppCubit>()),
              BlocProvider(
                create: (context) =>
                    getIt<ProfileCubit>()..emitGetProfileState(),
              ),
            ],
            child: const BottomNavigationBarScreen(),
          ),
        );

      // Home
      case Routes.notification:
        return AnimationRoute(page: const NotificationScreen());
      case Routes.search:
        return AnimationRoute(
          page: BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: const SearchScreen(),
          ),
        );
      case Routes.exhibitions:
        return AnimationRoute(page: const ExhibitionsScreen());
      case Routes.artworks:
        return AnimationRoute(page: const ArtworksScreen());

      // Profile
      case Routes.myProfile:
        return AnimationRoute(
          page: BlocProvider.value(
            value: getIt<ProfileCubit>()..setProfileControllers(),
            child: const MyProfileScreen(),
          ),
        );
      case Routes.yourOrder:
        return AnimationRoute(page: const YourOrderScreen());
      case Routes.addresses:
        return AnimationRoute(
          page: BlocProvider.value(
            value: getIt<ProfileCubit>(),
            child: const AddressesScreen(),
          ),
        );
      case Routes.changePassword:
        return AnimationRoute(
          page: BlocProvider.value(
            value: getIt<ProfileCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );
      case Routes.reportProblem:
        return AnimationRoute(page: const ReportProblemScreen());
      case Routes.helpCenter:
        return AnimationRoute(page: const HelpCenterScreen());
      case Routes.communityGuidelines:
        return AnimationRoute(page: const CommunityGuidelinesScreen());
      case Routes.termsOfUse:
        return AnimationRoute(page: const TermsOfUseScreen());
      case Routes.addAddress:
        return AnimationRoute(
          page: BlocProvider.value(
            value: getIt<ProfileCubit>(),
            child: const AddAddressScreen(),
          ),
        );

      // Exhibition
      case Routes.exhibitionDetails:
        return AnimationRoute(page: const ExhibitionDetailsScreen());

      // Artwork
      case Routes.artworkDetails:
        return AnimationRoute(page: const ArtworkDetailsScreen());
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
