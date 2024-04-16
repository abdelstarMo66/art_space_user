import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridViewWithAnimation extends StatelessWidget {
  final int itemCount, crossAxisCount;
  final List<Widget> child;

  const CustomGridViewWithAnimation(
      {super.key,
      required this.itemCount,
      required this.crossAxisCount,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: MasonryGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 22.0,
        crossAxisSpacing: 12.0,
        itemCount: itemCount,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 500),
          columnCount: crossAxisCount,
          child: ScaleAnimation(
            duration: const Duration(milliseconds: 900),
            curve: Curves.fastLinearToSlowEaseIn,
            child: FadeInAnimation(
              child: child[index],
            ),
          ),
        ),
      ),
    );
  }
}
