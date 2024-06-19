import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/artworks/logic/artwork_cubit.dart';
import 'package:art_space_user/features/artworks/logic/artwork_state.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_details_images_item.dart';
import 'package:art_space_user/features/artworks/ui/widgets/artwork_details_type_item.dart';
import 'package:art_space_user/features/cart/logic/cart_cubit.dart';
import 'package:art_space_user/features/cart/logic/cart_states.dart';
import 'package:art_space_user/main.dart';
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
        String productId =
            state is GetArtworkSuccess ? state.getArtworkResponse.data.id : "";

        return Scaffold(
          appBar: CustomAppBar(
            actions: [
              if (arSupport)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextButton(
                    onPressed: () => context.pushNamed(Routes.arPreview),
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
          bottomSheet: state is GetArtworkSuccess
              ? state.getArtworkResponse.data.isAvailable
                  ? BlocProvider<CartCubit>(
                      create: (context) => getIt<CartCubit>(),
                      child: BlocConsumer<CartCubit, CartStates>(
                        listener: (context, state) {
                          if (state is AddCartSuccessState) {
                            AnimatedSnackBar.material(
                              state.addCartResponse.message,
                              type: AnimatedSnackBarType.success,
                              animationCurve: Curves.fastEaseInToSlowEaseOut,
                              mobileSnackBarPosition:
                                  MobileSnackBarPosition.bottom,
                            ).show(context);
                          }
                          if (state is AddCartFailureState) {
                            AnimatedSnackBar.material(
                              state.message,
                              type: AnimatedSnackBarType.error,
                              animationCurve: Curves.fastEaseInToSlowEaseOut,
                              mobileSnackBarPosition:
                                  MobileSnackBarPosition.bottom,
                            ).show(context);
                          }
                        },
                        builder: (context, state) {
                          return Container(
                            color: ColorManager.originalWhite,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0,
                            ),
                            child: AnimatedCrossFade(
                              firstChild: AppTextButton(
                                buttonText: "Add To Cart",
                                borderRadius: 14.0,
                                buttonHeight: 55.0,
                                textStyle: TextStyleManager
                                    .font20OriginalWhiteSemiBold,
                                onPressed: () {
                                  context
                                      .read<CartCubit>()
                                      .emitAddProductToCartState(productId);
                                },
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
                                  child:
                                      LoadingAnimationWidget.fourRotatingDots(
                                    color: ColorManager.originalWhite,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                              crossFadeState: state is AddCartLoadingState
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 700),
                            ),
                          );
                        },
                      ),
                    )
                  : null
              : null,
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
                          coverImage:
                              state.getArtworkResponse.data.coverImage.image,
                          images: state.getArtworkResponse.data.images,
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
                                    image: state.getArtworkResponse.data.owner
                                        .profileImg,
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
                            if (state.getArtworkResponse.data.isAvailable)
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
