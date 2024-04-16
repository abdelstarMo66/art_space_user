import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/font_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/response/artist_response.dart';

class ArtistInfo extends StatelessWidget {
  final Data artistInfo;

  const ArtistInfo({super.key, required this.artistInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: AppNetworkImage(
                  image: artistInfo.artist.profileImg,
                  width: 70.0,
                  height: 70.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${artistInfo.artworks.length}',
                    style: TextStyleManager.font18PurpleRegular,
                  ),
                  Text(
                    "Artworks",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.font16LighterBlackRegular
                        .copyWith(fontWeight: FontWeightManager.semiBold),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${artistInfo.exhibitions.length}',
                    style: TextStyleManager.font18PurpleRegular,
                  ),
                  Text(
                    "Exhibitions",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.font16LighterBlackRegular
                        .copyWith(fontWeight: FontWeightManager.semiBold),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${artistInfo.auctions.length}',
                    style: TextStyleManager.font18PurpleRegular,
                  ),
                  Text(
                    "Auctions",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.font16LighterBlackRegular
                        .copyWith(fontWeight: FontWeightManager.semiBold),
                  )
                ],
              ),
            ],
          ),
          verticalSpace(4.0),
          Text(
            artistInfo.artist.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.font22LightBlackBold.copyWith(
              color: ColorManager.gold,
            ),
          ),
          Text(
            artistInfo.artist.bio,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.font16GrayRegular,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Divider(
              height: 25,
              thickness: 0.5,
              color: ColorManager.lighterGray,
            ),
          ),
        ],
      ),
    );
  }
}
