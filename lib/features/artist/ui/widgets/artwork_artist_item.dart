import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../data/models/response/artist_response.dart';

class ArtworkArtistItem extends StatelessWidget {
  final Artwork artworkInfo;

  const ArtworkArtistItem({super.key, required this.artworkInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        context.pushReplacementNamed(
          Routes.artworkDetails,
          arguments: artworkInfo.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                AppNetworkImage(
                  image: artworkInfo.coverImage.image,
                  width: double.maxFinite,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 7.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: ColorManager.lighterBlack.withOpacity(0.7),
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(8.0),
                      bottomEnd: Radius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "\$ ${artworkInfo.price}",
                    style: TextStyleManager.font14OriginalWhiteSemiBold
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            verticalSpace(12.0),
            Text(
              artworkInfo.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyleManager.font18LightBlackBold
                  .copyWith(fontSize: 16.sp),
            ),
            verticalSpace(2.0),
            Text(
              artworkInfo.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleManager.font14DarkPurpleSemiBold
                  .copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
