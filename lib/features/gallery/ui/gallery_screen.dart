import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/helpers/spacing.dart';
import '../../artworks/ui/widgets/artwork_item.dart';
import '../../home/ui/widgets/explore_exhibitions.dart';
import '../../home/ui/widgets/recently_artworks_list.dart';
import '../../home/ui/widgets/title_of_list.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(12.0),
                  Text(
                    "Booked Exhibition",
                    style: TextStyleManager.font22LightBlackBold,
                  ),
                  verticalSpace(8.0),
                ],
              ),
            ),
          ),
          const ExploreExhibitions(),
          SliverToBoxAdapter(child: verticalSpace(20.0)),
          TitleOfList(
            title: "Registered Auctions",
            onTap: () {},
          ),
          SliverToBoxAdapter(
            child: AnimationLimiter(
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 22.0,
                crossAxisSpacing: 12.0,
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: 2,
                  child: const ScaleAnimation(
                    duration: Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      child: ArtworkItem(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20.0),
                  Text(
                    "More Auctions",
                    style: TextStyleManager.font22LightBlackBold,
                  ),
                  verticalSpace(8.0),
                ],
              ),
            ),
          ),
          const RecentlyArtworksList(),
          SliverToBoxAdapter(child: verticalSpace(70.0)),
        ],
      ),
    );
  }
}
