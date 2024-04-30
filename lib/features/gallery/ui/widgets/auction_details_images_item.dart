import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_auction_response.dart';
import 'package:flutter/material.dart';

class AuctionDetailsImagesItem extends StatefulWidget {
  final String coverImage;
  final List<ProductImage> images;

  const AuctionDetailsImagesItem({
    super.key,
    required this.coverImage,
    required this.images,
  });

  @override
  State<AuctionDetailsImagesItem> createState() =>
      _AuctionDetailsImagesItemState();
}

class _AuctionDetailsImagesItemState extends State<AuctionDetailsImagesItem>
    with TickerProviderStateMixin {
  final List<String> images = [];
  int selectedImage = 0;
  late AnimationController fadeAnimation;

  @override
  void initState() {
    super.initState();
    images.add(widget.coverImage);
    for (int i = 0; i < widget.images.length; i++) {
      images.add(widget.images[i].image);
    }
    fadeAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: AppNetworkImage(
              image: images[selectedImage],
              width: double.infinity,
            ),
          ),
        ),
        verticalSpace(8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < images.length; i++) ...[
                if (i != selectedImage)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = i;
                        fadeAnimation = AnimationController(
                          vsync: this,
                          duration: const Duration(milliseconds: 800),
                        )..forward();
                      });
                    },
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AppNetworkImage(
                          image: images[i],
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
