import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            ProfileCubit cubit = context.read<ProfileCubit>();

            return cubit.profile != null
                ? GestureDetector(
                    onTap: () => context.pushNamed(Routes.myProfile),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: AppNetworkImage(
                            image: cubit.profile!.data.profileImg ?? "",
                            width: 70.0,
                            height: 70.0,
                          ),
                        ),
                        horizontalSpace(12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cubit.profile!.data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleManager.font18LightBlackBold,
                              ),
                              verticalSpace(4.0),
                              Text(
                                cubit.profile!.data.email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleManager.font14LightGrayMedium,
                              ),
                              verticalSpace(8.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : AppCustomShimmer(
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 40.0),
                        horizontalSpace(12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.0,
                                height: 15.0,
                                color: Colors.white,
                              ),
                              verticalSpace(12.0),
                              Container(
                                width: 220.0,
                                height: 15.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
        const Divider(
          height: 30.0,
          color: ColorManager.lightGray,
          thickness: 0.2,
        ),
      ],
    );
  }
}
