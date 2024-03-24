import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class HomeArtworkItem extends StatelessWidget {
  const HomeArtworkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate To Details Screen
      },
      onLongPress: () {
        // TODO: Add To Favourites List And Show Cool Animation
      },
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
                ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(12.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/ds0475-f2_qdcxx_99879490.jpg",
                    width: 120.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
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
                          "Freya Freya Freya Freya ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleManager.font24OLightBlackSemiBold,
                        ),
                        verticalSpace(4.0),
                        Text(
                          "A beautiful acrylic painting on canvas of a Nordic warrior woman. One of a kind. Ready to hang.",
                          // "A beautiful acrylic painting ",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleManager.font14LightBlackMedium,
                        ),
                        verticalSpace(4.0),
                        Text(
                          "Elizabete Caires",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleManager.font16DarkPurpleSemiBold,
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
            width: 120.0,
            decoration: const BoxDecoration(
              color: ColorManager.dartPurple,
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(12.0)),
            ),
            child: Text(
              "£400.00",
              textAlign: TextAlign.center,
              style: TextStyleManager.font22LighterGraySemiBold,
            ),
          )
        ],
      ),
    );
  }
}
