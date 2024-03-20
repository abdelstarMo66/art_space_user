import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'exhibition_item.dart';

class ExploreExhibitions extends StatelessWidget {
  const ExploreExhibitions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            const ExhibitionItem(),
        options: CarouselOptions(
          height: 240.0.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          // enableInfiniteScroll: true,
          // reverse: false,
          // autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
