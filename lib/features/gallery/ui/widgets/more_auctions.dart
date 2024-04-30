import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:art_space_user/features/gallery/ui/widgets/auction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreAuctionsList extends StatelessWidget {
  const MoreAuctionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryStates>(
      builder: (context, state) {
        GalleryCubit cubit = context.read<GalleryCubit>();

        return SliverList.builder(
          itemCount: cubit.allAuctions.isEmpty ? 10 : cubit.allAuctions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: cubit.allAuctions.isNotEmpty
                  ? AuctionItem(
                      auction: cubit.allAuctions[index],
                    )
                  : AppCustomShimmer(
                      child: Container(
                        height: 180.0,
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
