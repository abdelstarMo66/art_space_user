import 'package:flutter/material.dart';

import '../../../../core/theming/text_style_manager.dart';

class TitleOfList extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleOfList({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyleManager.font22LightBlackBold,
            ),
            const Spacer(),
            TextButton(
              onPressed: onTap,
              child: Text(
                "See More",
                style: TextStyleManager.font16DarkPurpleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
