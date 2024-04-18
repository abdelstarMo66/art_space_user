import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/features/home/logic/home_cubit.dart';
import 'package:art_space_user/features/home/logic/home_states.dart';
import 'package:art_space_user/features/home/ui/widgets/home_artwork_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentlyArtworksList extends StatelessWidget {
  const RecentlyArtworksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();

        return SliverList.builder(
          itemCount: cubit.allArtworks.isEmpty ? 10 : cubit.allArtworks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: cubit.allArtworks.isNotEmpty
                  ? HomeArtworkItem(
                      artwork: cubit.allArtworks[index],
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
