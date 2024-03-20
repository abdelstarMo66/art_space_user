import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';

class ArtworkItem extends StatelessWidget {
  const ArtworkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/puffins_8a7qv_1927740348.jpg",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Gif(
                        image: const AssetImage(AssetsManager.gifLoading),
                        fps: 15,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        autostart: Autostart.loop
                    ),
                width: double.maxFinite,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: ColorManager.lighterBlack.withOpacity(0.7),
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(8.0),
                    bottomEnd: Radius.circular(8.0),
                  ),
                ),
                child: Text(
                  "\$250.00",
                  style: TextStyleManager.font14OriginalWhiteSemiBold,
                ),
              ),
            ],
          ),
          verticalSpace(12.0),
          Text(
            "Puffins",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.font20LightBlackBold,
          ),
          verticalSpace(2.0),
          Text(
            "Kovacs Anna Brigitta",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.font14LighterBlackRegular,
          ),
          verticalSpace(2.0),
          Text(
            "Watercolours",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.font14DarkPurpleSemiBold,
          ),
        ],
      ),
    );
  }
}
