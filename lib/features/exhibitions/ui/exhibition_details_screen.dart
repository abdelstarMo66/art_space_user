import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../artworks/ui/widgets/artwork_item.dart';

class ExhibitionDetailsScreen extends StatelessWidget {
  const ExhibitionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        bgColor: ColorManager.transparent,
      ),
      extendBodyBehindAppBar: true,
      bottomSheet: Container(
        color: ColorManager.originalWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: AppTextButton(
          buttonText: "Book Exhibition",
          borderRadius: 14.0,
          buttonHeight: 55.0,
          textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
          onPressed: () {},
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(12.0),
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(42.0),
                    bottomLeft: Radius.circular(42.0),
                  ),
                  child: AppNetworkImage(
                    image:
                        "https://images.artnet.com/gallery-images/423794792/fdfe8103-b04f-4cfb-898a-7ad29eedfeb5.jpg?x=550%40%211320xaD01NTAmdz0xMzIwJmY9Y292ZXImdD1s",
                    width: double.maxFinite,
                  ),
                ),
                verticalSpace(18.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Augmented Empathy",
                              style: TextStyleManager.font22LightBlackBold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // TODO: change icon color to yellow
                            },
                            icon: SvgPicture.asset(
                              AssetsManager.icNotification,
                              width: 32.0,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(12.0),
                      Text(
                        "GRIMM represents over thirty international artists with locations in Amsterdam (NL), New York (US) and London (UK). Since its establishment in 2005, it has been the gallery’s mission to represent and support the work of emerging and mid-career artists.",
                        style: TextStyleManager.font16GrayRegular,
                      ),
                      verticalSpace(8.0),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Elizabete Caires",
                          style: TextStyleManager.font16DarkPurpleSemiBold,
                        ),
                      ),
                      verticalSpace(12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "From: ",
                                      style: TextStyleManager
                                          .font16DarkPurpleSemiBold,
                                    ),
                                    TextSpan(
                                      text: "12/05/2024",
                                      style: TextStyleManager
                                          .font16LighterBlackRegular,
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "To: ",
                                      style: TextStyleManager
                                          .font16DarkPurpleSemiBold,
                                    ),
                                    TextSpan(
                                      text: "12/05/2024",
                                      style: TextStyleManager
                                          .font16LighterBlackRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            "12 days",
                            style: TextStyleManager.font16DarkPurpleMedium,
                          ),
                          horizontalSpace(18.0),
                        ],
                      ),
                      verticalSpace(12.0),
                      Row(
                        children: [
                          Text(
                            "Artworks",
                            style: TextStyleManager.font20LightBlackBold,
                          ),
                          const Spacer(),
                          // TODO: show when the exhibition started and the user already booked
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: ColorManager.lighterGray,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                            child: Text(
                              "launch VR Mode",
                              style: TextStyleManager.font18PurpleRegular,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(12.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < 6; i++) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: ArtworkItem(
                        imageWidth: 250.0,
                        imageHeight: 250,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(120.0),
          )
        ],
      ),
    );
  }
}
