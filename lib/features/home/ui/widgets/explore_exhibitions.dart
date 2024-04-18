import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/features/home/logic/home_cubit.dart';
import 'package:art_space_user/features/home/logic/home_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_exhibition_item.dart';

class ExploreExhibitions extends StatelessWidget {
  const ExploreExhibitions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          HomeCubit cubit = context.read<HomeCubit>();
          return CarouselSlider.builder(
            itemCount: cubit.allExhibitions.isNotEmpty
                ? cubit.allExhibitions.length
                : 5,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                cubit.allExhibitions.isNotEmpty
                    ? HomeExhibitionItem(
                        exhibition: cubit.allExhibitions[index])
                    : AppCustomShimmer(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0)),
                        ),
                      ),
            options: CarouselOptions(
              height: 240.0.h,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 1200),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}
