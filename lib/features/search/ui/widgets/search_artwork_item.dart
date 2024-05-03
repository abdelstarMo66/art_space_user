import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/search/data/models/response/search_response.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class SearchArtworkItem extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final Product artwork;

  const SearchArtworkItem({
    super.key,
    this.imageWidth,
    this.imageHeight,
    required this.artwork,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.artworkDetails,
        arguments: artwork.id,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                AppNetworkImage(
                  image: artwork.coverImage ?? "",
                  width: imageWidth ?? double.maxFinite,
                  height: imageHeight,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: ColorManager.lighterBlack.withOpacity(0.7),
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(8.0),
                      bottomEnd: Radius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "\$ ${artwork.price}",
                    style: TextStyleManager.font14OriginalWhiteSemiBold,
                  ),
                ),
              ],
            ),
            verticalSpace(12.0),
            Text(
              artwork.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleManager.font20LightBlackBold,
            ),
            verticalSpace(2.0),
            Text(
              artwork.owner.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleManager.font14LighterBlackRegular,
            ),
            verticalSpace(2.0),
            Text(
              artwork.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleManager.font14DarkPurpleSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
