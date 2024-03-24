import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_detailes_images_item.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_details_type_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/custom_app_bar.dart';

class ArtworkDetailsScreen extends StatelessWidget {
  const ArtworkDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomSheet: Container(
        color: ColorManager.originalWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: AppTextButton(
          buttonText: "Add To Cart",
          borderRadius: 14.0,
          buttonHeight: 55.0,
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: ArtworkDetailsImagesItem2(),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(18.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Pale Pink Garden_Dark",
                          style: TextStyleManager.font22LightBlackBold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: ColorManager.purple.withOpacity(0.085),
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: ColorManager.purple,
                          ),
                        ),
                        child: Text(
                          "mixed media",
                          style: TextStyleManager.font16DarkPurpleMedium,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8.0),
                  Text(
                    "Pale Pink theme -Digital photographic collages carefully Hand edited from my own plant photography. It’s a voyage of discovery as I often find things – like bees and initially un-noticed plants among the image - I then decide what to include and what to take out - Limited Editions of 10 – Choice of background – Each one Hand signed and numbered - individual images only used in this print - Giclee standard prints on heavy paper – map of plants names included – Shipped in large plastic tube.",
                    style: TextStyleManager.font16GrayRegular,
                  ),
                  verticalSpace(12.0),
                  GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0.0,
                      leading: const CircleAvatar(
                        radius: 36.0,
                      ),
                      title: Text(
                        "Sally Maltby",
                        style: TextStyleManager.font18PurpleRegular,
                      ),
                    ),
                  ),
                  verticalSpace(8.0),
                  const ArtworkDetailsTypeItem(),
                  verticalSpace(75.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
