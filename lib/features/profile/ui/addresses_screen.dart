import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:art_space_user/features/profile/ui/widgets/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/color_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/app_custom_shimmer.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Address Book",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is DeleteAddressLoadingState) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: ColorManager.purple, size: 50.0),
              ),
            );
          }
          if (state is DeleteAddressSuccessState) {
            context.pop();
            AnimatedSnackBar.material(
              state.deleteAddressResponse.message,
              type: AnimatedSnackBarType.success,
              animationCurve: Curves.fastEaseInToSlowEaseOut,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            ).show(context);
            context.read<ProfileCubit>().emitGetProfileState();
          }
        },
        builder: (context, state) {
          ProfileCubit cubit = context.read<ProfileCubit>();
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              if (cubit.addresses.isNotEmpty) ...[
                cubit.addresses.isNotEmpty?SliverList.builder(
                  itemCount: cubit.addresses.length,
                  itemBuilder: (BuildContext context, int index) => AddressItem(
                    address: cubit.addresses[index],
                  ),
                ): const NoThingWidget(),
              ] else ...[
                SliverToBoxAdapter(
                  child: AppCustomShimmer(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 12.0),
                      itemBuilder: (context, index) => Row(
                        children: [
                          SvgPicture.asset(
                            AssetsManager.icAddress,
                            width: 32.0,
                          ),
                          horizontalSpace(12.0),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 12.0,
                                  color: Colors.white,
                                ),
                                verticalSpace(10.0),
                                Container(
                                  height: 12.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          horizontalSpace(20.0),
                          SvgPicture.asset(AssetsManager.icRemove),
                        ],
                      ),
                      separatorBuilder: (context, index) => verticalSpace(24.0),
                      itemCount: 5,
                    ),
                  ),
                ),
              ],
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  child: AppTextButton(
                    backgroundColor: ColorManager.lighterGray,
                    borderRadius: 12.0,
                    buttonText: "Add New Address",
                    textStyle: TextStyleManager.font18LightBlackSemiBold,
                    onPressed: () {
                      context.pushNamed(Routes.addAddress);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
