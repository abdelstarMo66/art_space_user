import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:art_space_user/features/profile/ui/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/widgets/custom_app_bar.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is UpdateProfileImageSuccessState) {
            context.read<ProfileCubit>().emitGetProfileState();

            AnimatedSnackBar.material(
              state.updateProfileImageResponse.message,
              type: AnimatedSnackBarType.success,
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            ).show(context);
          }
          if (state is UpdateProfileImageFailureState) {
            AnimatedSnackBar.material(
              state.message,
              type: AnimatedSnackBarType.error,
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            ).show(context);
          }
        },
        builder: (context, state) {
          final response = context.read<ProfileCubit>().profile!.data;

          return Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  state is UpdateProfileImageLoadingState
                      ? Center(
                          child: LoadingAnimationWidget.fourRotatingDots(
                              color: ColorManager.purple, size: 100.0),
                        )
                      : Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Card(
                                shadowColor: ColorManager.dartPurple,
                                elevation: 2.0,
                                margin: EdgeInsets.zero,
                                child: AppNetworkImage(
                                  image: response.profileImg ?? "",
                                  width: 200.0,
                                  height: 200.0,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ProfileCubit>()
                                    .emitUpdateProfileImageState();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: ColorManager.dartPurple,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(16.0),
                                    topStart: Radius.circular(16.0),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  AssetsManager.icEdit,
                                  width: 28.0,
                                  height: 28.0,
                                  colorFilter: const ColorFilter.mode(
                                    ColorManager.lighterGray,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  const ProfileForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
