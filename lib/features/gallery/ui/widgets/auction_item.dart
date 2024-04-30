import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../data/models/response/get_all_auctions_response.dart';

class AuctionItem extends StatelessWidget {
  final Auction auction;

  const AuctionItem({super.key, required this.auction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.auctionDetails,
        arguments: auction.id,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        color: ColorManager.moreLightGray,
        elevation: 1.0,
        shadowColor: ColorManager.purple,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12.0),
                bottomStart: Radius.circular(12.0),
              ),
              child: AppNetworkImage(
                image: auction.coverImage.image,
                width: 120.0,
                height: 180.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 8.0,
                  start: 12.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      auction.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleManager.font24OLightBlackSemiBold,
                    ),
                    verticalSpace(4.0),
                    Text(
                      auction.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleManager.font14LightBlackMedium,
                    ),
                    verticalSpace(4.0),
                    Text(
                      "💰${auction.price.toDouble()}",
                      textAlign: TextAlign.center,
                      style: TextStyleManager.font18LightBlackSemiBold,
                    ),
                    verticalSpace(4.0),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(
                        auction.artist.name,
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
    );
  }
}
