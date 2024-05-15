import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/artworks/data/models/all_artwork_model.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_cubit.dart';
import 'package:art_space_user/features/exhibitions/logic/exhibition_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        ExhibitionCubit cubit = context.read<ExhibitionCubit>();

        return Scaffold(
          appBar: const CustomAppBar(
            bgColor: ColorManager.transparent,
          ),
          extendBodyBehindAppBar: true,
          bottomSheet: cubit.singleExhibition != null
              ? !cubit.singleExhibition!.userBookedThisEvent
                  ? BlocListener<ExhibitionCubit, ExhibitionStates>(
                      listener: (context, state) {
                        if (state is BookExhibitionSuccess) {
                          AnimatedSnackBar.material(
                            state.bookExhibitionResponse.message,
                            type: AnimatedSnackBarType.success,
                            animationCurve: Curves.fastEaseInToSlowEaseOut,
                            mobileSnackBarPosition:
                                MobileSnackBarPosition.bottom,
                          ).show(context);
                        }
                        if (state is BookExhibitionFailure) {
                          AnimatedSnackBar.material(
                            state.message,
                            type: AnimatedSnackBarType.error,
                            animationCurve: Curves.fastEaseInToSlowEaseOut,
                            mobileSnackBarPosition:
                                MobileSnackBarPosition.bottom,
                          ).show(context);
                        }
                      },
                      child: Container(
                        color: ColorManager.originalWhite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: AnimatedCrossFade(
                          firstChild: AppTextButton(
                            buttonText: "Book Exhibition",
                            borderRadius: 14.0,
                            buttonHeight: 55.0,
                            textStyle:
                                TextStyleManager.font20OriginalWhiteSemiBold,
                            onPressed: () => context
                                .read<ExhibitionCubit>()
                                .emitBookExhibitionState(
                                    exhibitionId: cubit.singleExhibition!.id),
                          ),
                          secondChild: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: ColorManager.purple,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            child: Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                color: ColorManager.originalWhite,
                                size: 35.0,
                              ),
                            ),
                          ),
                          crossFadeState: state is BookExhibitionLoading
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 700),
                        ),
                      ),
                    )
                  : null
              : null,
          body: cubit.singleExhibition != null
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
                              image: cubit.singleExhibition!.coverImage,
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
                                        cubit.singleExhibition!.title,
                                        style: TextStyleManager
                                            .font22LightBlackBold,
                                      ),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {
                                    //
                                    //   },
                                    //   icon: SvgPicture.asset(
                                    //     AssetsManager.icNotification,
                                    //     width: 32.0,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                verticalSpace(12.0),
                                Text(
                                  cubit.singleExhibition!.description,
                                  style: TextStyleManager.font16GrayRegular,
                                ),
                                verticalSpace(8.0),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: GestureDetector(
                                    onTap: () => context.pushNamed(
                                      Routes.artist,
                                      arguments:
                                          cubit.singleExhibition!.owner.id,
                                    ),
                                    child: Text(
                                      cubit.singleExhibition!.owner.name,
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
                                                text: cubit
                                                    .singleExhibition!.began
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
                                                text: cubit
                                                    .singleExhibition!.end
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
                                      "${cubit.singleExhibition!.duration} days",
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
                                    // TextButton(
                                    //   onPressed: () {},
                                    //   style: TextButton.styleFrom(
                                    //       backgroundColor:
                                    //           ColorManager.lighterGray,
                                    //       shape: RoundedRectangleBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(12.0))),
                                    //   child: Text(
                                    //     "launch VR Mode",
                                    //     style: TextStyleManager
                                    //         .font18PurpleRegular,
                                    //   ),
                                    // ),
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
                                i < cubit.singleExhibition!.artworks.length;
                                i++) ...[
                              Container(
                                width: 180.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ArtworkItem(
                                  imageWidth: 180.0,
                                  imageHeight: 150.0,
                                  artworkModel: AllArtworkModel(
                                    id: cubit.singleExhibition!.artworks[i].id,
                                    title: cubit
                                        .singleExhibition!.artworks[i].title,
                                    price: cubit
                                        .singleExhibition!.artworks[i].price
                                        .toString(),
                                    image: cubit.singleExhibition!.artworks[i]
                                        .coverImage,
                                    ownerName: cubit.singleExhibition!
                                        .artworks[i].artist.name,
                                    category: cubit
                                        .singleExhibition!.artworks[i].category,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (!cubit.singleExhibition!.userBookedThisEvent)
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
