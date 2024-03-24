import 'package:flutter/material.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class SearchTapBar extends StatelessWidget {
  final TabController tabController;
  final PageController pageController;

  const SearchTapBar(
      {super.key, required this.tabController, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.originalWhite,
      child: TabBar(
        onTap: (value) => pageController.animateToPage(
          value,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        ),
        labelPadding: const EdgeInsets.all(2.0),
        indicatorColor: ColorManager.purple,
        controller: tabController,
        indicatorWeight: 1,
        labelStyle: TextStyleManager.font18PurpleRegular,
        unselectedLabelColor: ColorManager.gray,
        labelColor: ColorManager.purple,
        dividerHeight: 0.0,
        tabs: const [
          Tab(
            child: Text(
              'Artwork',
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: Text(
              'Exhibition',
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: Text(
              'Artist',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
