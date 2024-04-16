import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/artist/logic/artist_cubit.dart';
import 'package:art_space_user/features/artist/logic/artist_state.dart';
import 'package:art_space_user/features/artist/ui/widgets/artist_info.dart';
import 'package:art_space_user/features/artist/ui/widgets/artist_tap_bar.dart';
import 'package:art_space_user/features/artist/ui/widgets/artwork_artist_item.dart';
import 'package:art_space_user/features/artist/ui/widgets/auction_artist_item.dart';
import 'package:art_space_user/features/artist/ui/widgets/exhibition_artist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/theming/color_manager.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocBuilder<ArtistCubit, ArtistStates>(
        builder: (context, state) {
          ArtistCubit cubit = context.read<ArtistCubit>();
          return Scaffold(
            appBar: CustomAppBar(
              title: AnimatedOpacity(
                opacity: state is ArtistSuccessState ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Text(
                  state is ArtistSuccessState
                      ? state.artistResponse.data.artist.email
                      : "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleManager.font14LightBlackMedium,
                ),
              ),
            ),
            body: state is ArtistSuccessState || state is ChangeTapBarState
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ArtistInfo(artistInfo: cubit.artistResponse.data),
                        const ArtistTapBar(),
                        verticalSpace(10.0),
                        context.read<ArtistCubit>().tIndex == 0
                            ? AnimationLimiter(
                                child: MasonryGridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 22.0,
                                  crossAxisSpacing: 12.0,
                                  itemCount:
                                      cubit.artistResponse.data.artworks.length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  itemBuilder: (context, index) =>
                                      AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 500),
                                    columnCount: 3,
                                    child: ScaleAnimation(
                                      duration:
                                          const Duration(milliseconds: 900),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                        child: ArtworkArtistItem(
                                          artworkInfo: cubit.artistResponse.data
                                              .artworks[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : context.read<ArtistCubit>().tIndex == 1
                                ? AnimationLimiter(
                                    child: MasonryGridView.count(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 22.0,
                                      crossAxisSpacing: 12.0,
                                      itemCount: cubit.artistResponse.data
                                          .exhibitions.length,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      itemBuilder: (context, index) =>
                                          AnimationConfiguration.staggeredGrid(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        columnCount: 1,
                                        child: ScaleAnimation(
                                          duration:
                                              const Duration(milliseconds: 900),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          child: FadeInAnimation(
                                            child: ExhibitionArtistItem(
                                              exhibitionInfo: cubit
                                                  .artistResponse
                                                  .data
                                                  .exhibitions[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : AnimationLimiter(
                                    child: MasonryGridView.count(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 22.0,
                                      crossAxisSpacing: 12.0,
                                      itemCount: cubit
                                          .artistResponse.data.auctions.length,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      itemBuilder: (context, index) =>
                                          AnimationConfiguration.staggeredGrid(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        columnCount: 2,
                                        child: ScaleAnimation(
                                          duration:
                                              const Duration(milliseconds: 900),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          child: FadeInAnimation(
                                            child: AuctionArtistItem(
                                              auctionInfo: cubit.artistResponse
                                                  .data.auctions[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                      ],
                    ),
                  )
                : Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: ColorManager.purple,
                      size: 20.0,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
