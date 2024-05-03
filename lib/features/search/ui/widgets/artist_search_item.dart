import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../data/models/response/search_response.dart';

class ArtistSearchItem extends StatelessWidget {
  final Artist artist;

  const ArtistSearchItem({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.artist,
        arguments: artist.id,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: ColorManager.originalWhite,
            borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: AppNetworkImage(
                image: artist.profileImg ?? "",
                width: 60.0,
                height: 60.0,
              ),
            ),
            horizontalSpace(8.0),
            Text(artist.name, style: TextStyleManager.font24PurpleSemiBold)
          ],
        ),
      ),
    );
  }
}
