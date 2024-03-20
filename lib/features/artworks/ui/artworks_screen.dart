import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_item.dart';
import 'package:art_space_user/features/artworks/ui/widgets/sort_and_filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/text_style_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/artwork_filter_dialog.dart';

class ArtworksScreen extends StatelessWidget {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static ScrollController scrollController = ScrollController();

  const ArtworksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const ArtworkFilterDialog(),
      appBar:  CustomAppBar(
        title: Text(
          "Artworks",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 16.0, end: 12.0),
        child: FloatingActionButton(
          onPressed: () => scrollController.animateTo(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
          ),
          elevation: 2.0,
          backgroundColor: ColorManager.dartPurple,
          child: Transform.rotate(
            angle: 1.57079,
            child: SvgPicture.asset(
              AssetsManager.icArrowLeft,
              height: 45.0,
              colorFilter: const ColorFilter.mode(
                  ColorManager.originalWhite, BlendMode.srcIn),
            ),
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: MasonryGridView.count(
                controller: scrollController,
                crossAxisCount: 2,
                mainAxisSpacing: 22.0,
                crossAxisSpacing: 12.0,
                itemCount: 20,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => index == 0
                    ? SortAndFilterButton(scaffoldKey: scaffoldKey)
                    : const ArtworkItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
