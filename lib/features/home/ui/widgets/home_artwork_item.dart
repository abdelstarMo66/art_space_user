import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/home/data/models/response/recently_artwork_response.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class HomeArtworkItem extends StatelessWidget {
  final ArtworkInfo artwork;

  const HomeArtworkItem({super.key, required this.artwork});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205.0,
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.artworkDetails,
          arguments: artwork.id,
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: ColorManager.moreLightGray,
              elevation: 0.2,
              shadowColor: ColorManager.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(12.0),
                        bottomStart: Radius.circular(12.0),
                      ),
                      child: AppNetworkImage(
                        image: artwork.coverImage.image,
                        width: 120.0,
                        height: double.maxFinite,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 8.0,
                        start: 12.0,
                        top: 4.0,
                        bottom: 22.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            artwork.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleManager.font24OLightBlackSemiBold,
                          ),
                          verticalSpace(4.0),
                          Text(
                            artwork.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleManager.font14LightBlackMedium,
                          ),
                          verticalSpace(4.0),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Text(
                              artwork.owner.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleManager.font16DarkPurpleSemiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 8.0),
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              width: MediaQuery.sizeOf(context).width / 3.42,
              decoration: const BoxDecoration(
                color: ColorManager.dartPurple,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(12.0),
                ),
              ),
              child: Text(
                "💰${artwork.price.toDouble()}",
                textAlign: TextAlign.center,
                style: TextStyleManager.font22LighterGraySemiBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
