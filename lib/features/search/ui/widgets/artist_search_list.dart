import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'artist_search_item.dart';

class ArtistSearchList extends StatelessWidget {
  const ArtistSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const ArtistSearchItem(),
      separatorBuilder: (context, index) => verticalSpace(18.0),
      itemCount: 8,
    );
  }
}
