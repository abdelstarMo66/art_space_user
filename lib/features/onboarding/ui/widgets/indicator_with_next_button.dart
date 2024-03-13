import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/text_style_manager.dart';

class IndicatorWithNextButton extends StatelessWidget {
  final PageController pageController;

  const IndicatorWithNextButton({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: ColorManager.purple,
            dotColor: ColorManager.lightGray,
            dotHeight: 12,
            dotWidth: 12,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          child: Text(
            'Next',
            style: TextStyleManager.font18DarkBlueSemiBold,
          ),
        )
      ],
    );
  }
}
