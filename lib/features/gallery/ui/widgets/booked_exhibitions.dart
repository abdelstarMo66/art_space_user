import 'package:art_space_user/core/widgets/app_custom_shimmer.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:art_space_user/features/gallery/ui/widgets/booked_exhibitions_items.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookedExhibitionList extends StatelessWidget {
  const BookedExhibitionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<GalleryCubit, GalleryStates>(
        builder: (context, state) {
          GalleryCubit cubit = context.read<GalleryCubit>();

          return CarouselSlider.builder(
            itemCount: cubit.bookedExhibitions.isNotEmpty
                ? cubit.bookedExhibitions.length
                : 3,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                cubit.bookedExhibitions.isNotEmpty
                    ? BookedExhibitionsItem(
                        bookedExhibition: cubit.bookedExhibitions[index],
                      )
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
