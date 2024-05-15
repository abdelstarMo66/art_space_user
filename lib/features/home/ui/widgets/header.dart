import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ProfileStates>(
                  builder: (context, state) {
                    return Text(
                      "Hi, ${state is GetProfileSuccessState ? state.profileResponse.data.name.split(" ")[0] : '...'}",
                      style: TextStyleManager.font24LightBlackBold,
                    );
                  },
                ),
                Text(
                  "Began In Art Space",
                  style: TextStyleManager.font16GrayRegular,
                )
              ],
            ),
            const Spacer(),
            // IconButton(
            //   onPressed: () => context.pushNamed(Routes.notification),
            //   icon: SvgPicture.asset(AssetsManager.icNotification,
            //       width: 42.0,
            //       height: 42.0,
            //       colorFilter: const ColorFilter.mode(
            //           ColorManager.dartGray, BlendMode.srcIn)),
            // ),
          ],
        ),
      ),
    );
  }
}
