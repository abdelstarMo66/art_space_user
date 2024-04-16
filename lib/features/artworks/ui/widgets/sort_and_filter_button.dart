import 'package:art_space_user/features/artworks/logic/artwork_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import 'artwork_sort_dialog.dart';

class SortAndFilterButton extends StatelessWidget {
  final ArtworkCubit cubit;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SortAndFilterButton(
      {super.key, required this.scaffoldKey, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton(
            buttonHeight: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AssetsManager.icSort,
                  width: 25.0,
                  height: 25.0,
                ),
                Text(
                  "Sort",
                  style: TextStyleManager.font16OriginalWhiteRegular,
                )
              ],
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => ArtworkSortDialog(cubit: cubit),
              );
            },
          ),
        ),
        horizontalSpace(8.0),
        Expanded(
          child: AppElevatedButton(
            buttonHeight: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AssetsManager.icFilter,
                  width: 25.0,
                  height: 25.0,
                ),
                Text(
                  "Filter",
                  style: TextStyleManager.font16OriginalWhiteRegular,
                )
              ],
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
      ],
    );
  }
}
