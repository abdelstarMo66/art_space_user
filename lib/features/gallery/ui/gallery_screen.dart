import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/ui/widgets/booked_exhibitions.dart';
import 'package:art_space_user/features/gallery/ui/widgets/more_auctions.dart';
import 'package:art_space_user/features/gallery/ui/widgets/registered_auctions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GalleryCubit>(
      create: (context) => getIt<GalleryCubit>()
        ..emitGetAllAuctionsState()
        ..emitGetBookedExhibitionState()
        ..emitGetRegisteredAuctionState(),
      child: Padding(
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
                      "Booked Exhibitions",
                      style: TextStyleManager.font22LightBlackBold,
                    ),
                    verticalSpace(8.0),
                  ],
                ),
              ),
            ),
            const BookedExhibitionList(),
            SliverToBoxAdapter(child: verticalSpace(20.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(12.0),
                    Text(
                      "Registered Auctions",
                      style: TextStyleManager.font22LightBlackBold,
                    ),
                    verticalSpace(8.0),
                  ],
                ),
              ),
            ),
            const RegisteredAuctionList(),
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
            const MoreAuctionsList(),
            SliverToBoxAdapter(child: verticalSpace(90.0)),
          ],
        ),
      ),
    );
  }
}
