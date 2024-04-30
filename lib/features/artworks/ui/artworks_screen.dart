import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/artworks/data/models/all_artwork_model.dart';
import 'package:art_space_user/features/artworks/logic/artwork_cubit.dart';
import 'package:art_space_user/features/artworks/logic/artwork_state.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_item.dart';
import 'package:art_space_user/features/artworks/ui/widgets/sort_and_filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/artwork_filter_dialog.dart';

class ArtworksScreen extends StatelessWidget {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static ScrollController scrollController = ScrollController();

  const ArtworksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtworkCubit, ArtworkStates>(
      builder: (context, state) {
        ArtworkCubit cubit = context.read<ArtworkCubit>();

        return Scaffold(
          key: scaffoldKey,
          drawer: ArtworkFilterDialog(cubit: cubit),
          appBar: const CustomAppBar(),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                    child: AnimatedCrossFade(
                        firstChild: cubit.allArtworks.isNotEmpty
                            ? AnimationLimiter(
                                child: MasonryGridView.count(
                                  controller: scrollController,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 22.0,
                                  crossAxisSpacing: 12.0,
                                  itemCount: cubit.allArtworks.length + 1,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => index == 0
                                      ? SortAndFilterButton(
                                          scaffoldKey: scaffoldKey,
                                          cubit: cubit,
                                        )
                                      : AnimationConfiguration.staggeredGrid(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          columnCount: 2,
                                          child: ScaleAnimation(
                                            duration: const Duration(
                                                milliseconds: 900),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            child: FadeInAnimation(
                                              child: ArtworkItem(
                                                artworkModel: AllArtworkModel(
                                                  id: cubit
                                                      .allArtworks[index - 1]
                                                      .id,
                                                  title: cubit
                                                      .allArtworks[index - 1]
                                                      .title,
                                                  price: cubit
                                                      .allArtworks[index - 1]
                                                      .price
                                                      .toString(),
                                                  image: cubit
                                                      .allArtworks[index - 1]
                                                      .coverImage
                                                      .image,
                                                  ownerName: cubit
                                                      .allArtworks[index - 1]
                                                      .owner
                                                      .name,
                                                  category: cubit
                                                      .allArtworks[index - 1]
                                                      .category,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              )
                            : Container(
                                color: Colors.white,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NoThingWidget(),
                                  ],
                                ),
                              ),
                        secondChild: const LoadingAllArtworkGridView(),
                        duration: const Duration(seconds: 1),
                        crossFadeState: cubit.loadAllArtwork
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LoadingAllArtworkGridView extends StatelessWidget {
  const LoadingAllArtworkGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SizedBox(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 22.0,
          crossAxisSpacing: 12.0,
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => index == 0
              ? const SizedBox.shrink()
              : AppCustomShimmer(
            child: Container(
              height: 200.0,
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
