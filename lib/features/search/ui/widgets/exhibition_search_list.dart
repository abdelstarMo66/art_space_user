import 'package:art_space_user/features/home/ui/widgets/home_exhibition_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class ExhibitionSearchList extends StatelessWidget {
  const ExhibitionSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const IntrinsicHeight(child: HomeExhibitionItem()),
      separatorBuilder: (context, index) => verticalSpace(12.0),
      itemCount: 8,
    );
  }
}
