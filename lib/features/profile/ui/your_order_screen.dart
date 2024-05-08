import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:art_space_user/features/profile/ui/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourOrderScreen extends StatelessWidget {
  const YourOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Orders",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          ProfileCubit cubit = context.read<ProfileCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 6.0,
            ),
            child: state is YourOrdersLoadingState
                ? ListView.separated(
                    itemBuilder: (context, index) => AppCustomShimmer(
                      child: Container(
                        height: 160.0,
                        decoration: BoxDecoration(
                          color: ColorManager.originalWhite,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => verticalSpace(14.0),
                    itemCount: 4,
                  )
                : CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      if (cubit.orders.isNotEmpty) ...[
                        SliverList.separated(
                          itemCount: cubit.orders.length,
                          itemBuilder: (context, index) => OrderItem(
                            order: cubit.orders[index],
                          ),
                          separatorBuilder: (context, index) =>
                              verticalSpace(14.0),
                        ),
                      ] else ...[
                        const SliverToBoxAdapter(child: NoThingWidget()),
                      ]
                    ],
                  ),
          );
        },
      ),
    );
  }
}
