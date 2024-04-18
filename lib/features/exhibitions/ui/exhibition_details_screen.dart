import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/artworks/data/models/all_artwork_model.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_cubit.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_style_manager.dart';
import '../../artworks/ui/widgets/artwork_item.dart';

class ExhibitionDetailsScreen extends StatelessWidget {
  const ExhibitionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExhibitionCubit, ExhibitionStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            bgColor: ColorManager.transparent,
          ),
          extendBodyBehindAppBar: true,
          bottomSheet: Container(
            color: ColorManager.originalWhite,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: AppTextButton(
              buttonText: "Book Exhibition",
              borderRadius: 14.0,
              buttonHeight: 55.0,
              textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
              onPressed: () {},
            ),
          ),
          body: state is GetExhibitionSuccess
              ? CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(12.0),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(42.0),
                              bottomLeft: Radius.circular(42.0),
                            ),
                            child: AppNetworkImage(
                              image:
                                  state.getExhibitionResponse.data.coverImage,
                              width: double.maxFinite,
                            ),
                          ),
                          verticalSpace(18.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.getExhibitionResponse.data.title,
                                        style: TextStyleManager
                                            .font22LightBlackBold,
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
                                  state.getExhibitionResponse.data.description,
                                  style: TextStyleManager.font16GrayRegular,
                                ),
                                verticalSpace(8.0),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: InkWell(
                                    onTap: () => context.pushNamed(
                                      Routes.artist,
                                      arguments: state
                                          .getExhibitionResponse.data.owner.id,
                                    ),
                                    child: Text(
                                      state.getExhibitionResponse.data.owner
                                          .name,
                                      style: TextStyleManager
                                          .font16DarkPurpleSemiBold,
                                    ),
                                  ),
                                ),
                                verticalSpace(12.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                text: state
                                                    .getExhibitionResponse
                                                    .data
                                                    .began
                                                    .split("T")[0],
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
                                                text: state
                                                    .getExhibitionResponse
                                                    .data
                                                    .end
                                                    .split("T")[0],
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
                                      "${state.getExhibitionResponse.data.duration} days",
                                      style: TextStyleManager
                                          .font16DarkPurpleMedium,
                                    ),
                                    horizontalSpace(18.0),
                                  ],
                                ),
                                verticalSpace(12.0),
                                Row(
                                  children: [
                                    Text(
                                      "Artworks",
                                      style:
                                          TextStyleManager.font20LightBlackBold,
                                    ),
                                    const Spacer(),
                                    // TODO: show when the exhibition started and the user already booked
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              ColorManager.lighterGray,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0))),
                                      child: Text(
                                        "launch VR Mode",
                                        style: TextStyleManager
                                            .font18PurpleRegular,
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
                            for (var i = 0;
                                i <
                                    state.getExhibitionResponse.data.artworks
                                        .length;
                                i++) ...[
                              Container(
                                width: 180.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ArtworkItem(
                                  imageWidth: 180.0,
                                  imageHeight: 150.0,
                                  artworkModel: AllArtworkModel(
                                    id: state.getExhibitionResponse.data
                                        .artworks[i].id,
                                    title: state.getExhibitionResponse.data
                                        .artworks[i].title,
                                    price: state.getExhibitionResponse.data
                                        .artworks[i].price
                                        .toString(),
                                    image: state.getExhibitionResponse.data
                                        .artworks[i].coverImage,
                                    ownerName: state.getExhibitionResponse.data
                                        .artworks[i].artist.name,
                                    category: state.getExhibitionResponse.data
                                        .artworks[i].category,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: verticalSpace(80.0),
                    ),
                  ],
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
