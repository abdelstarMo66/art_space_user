import 'package:flutter/material.dart';

import '../../../../core/widgets/app_network_image.dart';
import '../../data/models/response/artist_response.dart';

class AuctionArtistItem extends StatelessWidget {
  final Auction auctionInfo;

  const AuctionArtistItem({super.key, required this.auctionInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: AppNetworkImage(
          image: auctionInfo.coverImage.image,
          width: double.maxFinite,
        ),
      ),
    );
  }
}
