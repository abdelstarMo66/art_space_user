import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/exhibitions/ui/widgets/exhibition_filter_dialog.dart';
import 'package:art_space_user/features/exhibitions/ui/widgets/exhibition_item.dart';
import 'package:art_space_user/features/exhibitions/ui/widgets/exhibition_sort_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../../core/utils/assets_manager.dart';

class ExhibitionsScreen extends StatelessWidget {

  const ExhibitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: CustomAppBar(
        actions: [
          AppElevatedButton(
            buttonWidth: 40.0,
            buttonHeight: 40.0,
            child: SvgPicture.asset(
              AssetsManager.icSort,
              width: 25.0,
              height: 25.0,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ExhibitionSortDialog(),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: AppElevatedButton(
              buttonWidth: 40.0,
              buttonHeight: 40.0,
              child: SvgPicture.asset(
                AssetsManager.icFilter,
                width: 25.0,
                height: 25.0,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const ExhibitionFilterDialog(),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) => ExhibitionItem(index: index),
              separatorBuilder: (context, index) => verticalSpace(12.0),
            ),
          ],
        ),
      ),
    );
  }
}
