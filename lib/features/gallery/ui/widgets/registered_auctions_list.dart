import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:art_space_user/features/gallery/ui/widgets/registered_auction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RegisteredAuctionList extends StatelessWidget {
  const RegisteredAuctionList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryStates>(
      builder: (context, state) {
        GalleryCubit cubit = context.read<GalleryCubit>();

        return SliverToBoxAdapter(
          child: AnimatedCrossFade(
            firstChild: cubit.registeredAuction.isNotEmpty
                ? AnimationLimiter(
                    child: MasonryGridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 22.0,
                      crossAxisSpacing: 12.0,
                      itemCount: cubit.registeredAuction.length,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        columnCount: 2,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: RegisteredAuctionItem(
                              registeredAuction: cubit.registeredAuction[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: Text(
                      "You Are Not Registered to any Auctions",
                      style: TextStyleManager.font16LighterBlackRegular,
                      textAlign: TextAlign.center,
                    ),
                  ),
            secondChild: AnimationLimiter(
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 22.0,
                crossAxisSpacing: 12.0,
                itemCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AppCustomShimmer(
                  child: Container(
                    height: 180.0,
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
            duration: const Duration(seconds: 1),
            crossFadeState: cubit.loadAllRegisteredAuction
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        );
      },
    );
  }
}
