import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/features/artist/logic/artist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class ArtistTapBar extends StatelessWidget {

  const ArtistTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.originalWhite,
      child: TabBar(
        onTap: (value) => context.read<ArtistCubit>().changeTab(value),
        labelPadding: const EdgeInsets.all(2.0),
        indicatorColor: ColorManager.purple,
        indicatorWeight: 1,
        labelStyle: TextStyleManager.font18PurpleRegular,
        unselectedLabelColor: ColorManager.gray,
        labelColor: ColorManager.purple,
        dividerHeight: 0.0,
        tabs: const [
          Tab(
            child: Text(
              'Artworks',
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: Text(
              'Exhibitions',
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: Text(
              'Auctions',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}