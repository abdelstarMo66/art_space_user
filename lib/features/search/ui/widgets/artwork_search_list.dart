import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../artworks/ui/widgets/artwork_item.dart';

class ArtworkSearchList extends StatelessWidget {
  const ArtworkSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const ArtworkItem(imageHeight: 180.0),
      separatorBuilder: (context, index) => verticalSpace(20.0),
      itemCount: 8,
    );
  }
}
