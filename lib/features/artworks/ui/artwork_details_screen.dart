import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/artworks/logic/artwork_cubit.dart';
import 'package:art_space_user/features/artworks/logic/artwork_state.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_details_images_item.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_details_type_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/custom_app_bar.dart';

class ArtworkDetailsScreen extends StatelessWidget {
  const ArtworkDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtworkCubit, ArtworkStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: ColorManager.gold.withOpacity(0.12)),
                  child: Stack(
                    children: [
                      // TODO: remove this if account is gold
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        child: Text(
                          "Try AR Mode",
                          style: TextStyleManager.font20OriginalWhiteSemiBold
                              .copyWith(
                            color: ColorManager.gold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Transform.rotate(
                          angle: 0.698131701,
                          child: SvgPicture.asset(AssetsManager.icQueen),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomSheet: Container(
            color: ColorManager.originalWhite,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: AppTextButton(
              buttonText: "Add To Cart",
              borderRadius: 14.0,
              buttonHeight: 55.0,
              textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
              onPressed: () {},
            ),
          ),
          body: state is GetArtworkSuccess
              ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 12.0,
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: ArtworkDetailsImagesItem(
                    coverImage: state
                        .getArtworkResponse.data.coverImage.profileImg,
                    images: state.getArtworkResponse.data.images,
                    price: state.getArtworkResponse.data.price.toString(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(8.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.getArtworkResponse.data.title,
                              style:
                              TextStyleManager.font22LightBlackBold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color:
                              ColorManager.purple.withOpacity(0.085),
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: ColorManager.purple,
                              ),
                            ),
                            child: Text(
                              state.getArtworkResponse.data.category,
                              style:
                              TextStyleManager.font16DarkPurpleMedium,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(8.0),
                      Text(
                        state.getArtworkResponse.data.description,
                        style: TextStyleManager.font16GrayRegular,
                      ),
                      verticalSpace(6.0),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 22.0),
                          decoration: const BoxDecoration(
                            color: ColorManager.purple,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(32.0),
                              bottomEnd: Radius.circular(32.0),
                            ),
                          ),
                          child: Text(
                            "${state.getArtworkResponse.data.price} 💸",
                            style: TextStyleManager
                                .font20OriginalWhiteSemiBold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.pushNamed(
                          Routes.artist,
                          arguments:
                          state.getArtworkResponse.data.owner.id,
                        ),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 6.0,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: AppNetworkImage(
                              image: state.getArtworkResponse.data
                                  .coverImage.profileImg,
                              width: 45.0,
                              height: 45.0,
                            ),
                          ),
                          title: Text(
                            state.getArtworkResponse.data.owner.name,
                            style: TextStyleManager.font18PurpleRegular,
                          ),
                        ),
                      ),
                      verticalSpace(8.0),
                      ArtworkDetailsTypeItem(
                        style: state.getArtworkResponse.data.style,
                        material:
                        state.getArtworkResponse.data.material ??
                            "undefined",
                        subject: state.getArtworkResponse.data.subject,
                        size: state.getArtworkResponse.data.size,
                      ),
                      verticalSpace(85.0),
                    ],
                  ),
                ),
              ],
            ),
          )
              : Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: ColorManager.purple,
                    size: 35.0,
                  ),
                ),
        );
      },
    );
  }
}
