import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/font_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/launch_url_function.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/app_text_form_field.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:art_space_user/features/gallery/ui/widgets/auction_details_images_item.dart';
import 'package:art_space_user/features/gallery/ui/widgets/auction_info_item.dart';
import 'package:art_space_user/features/gallery/ui/widgets/register_auction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/widgets/custom_app_bar.dart';

class AuctionDetailsScreen extends StatelessWidget {
  const AuctionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryStates>(
      listener: (context, state) {
        if (state is GetAuctionSuccessState) {
          context.read<GalleryCubit>().getAuctionPriceOnSocket();
        }
      },
      builder: (context, state) {
        GalleryCubit cubit = context.read<GalleryCubit>();

        return Scaffold(
          appBar: const CustomAppBar(),
          bottomSheet: cubit.thisAuction != null
              ? !cubit.thisAuction!.data.userRegisteredInThisAuction
                  ? BlocListener<GalleryCubit, GalleryStates>(
                      listener: (context, state) {
                        if (state is RegisterAuctionLoadingState) {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                color: ColorManager.purple,
                                size: 35.0,
                              ),
                            ),
                          );
                        }
                        if (state is RegisterAuctionFailureState) {
                          context.pop();
                          AnimatedSnackBar.material(
                            state.message,
                            type: AnimatedSnackBarType.error,
                            animationCurve: Curves.fastEaseInToSlowEaseOut,
                            mobileSnackBarPosition:
                                MobileSnackBarPosition.bottom,
                          ).show(context);
                        }
                        if (state is RegisterAuctionSuccessState) {
                          context.pop();
                          launchURL(context,
                              url: state.registerAuctionResponse.data.url);
                        }
                      },
                      child: Container(
                        color: ColorManager.originalWhite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        child: AnimatedCrossFade(
                          firstChild: AppTextButton(
                            buttonText: "Register In This Auction",
                            borderRadius: 14.0,
                            buttonHeight: 55.0,
                            textStyle:
                                TextStyleManager.font20OriginalWhiteSemiBold,
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) =>
                                  RegisterAuctionDialog(cubit: cubit),
                            ),
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
                          crossFadeState: state is RegisterAuctionLoadingState
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 700),
                        ),
                      ),
                    )
                  : null
              : null,
          body: cubit.thisAuction != null
              ? RefreshIndicator(
                  color: ColorManager.dartPurple,
                  onRefresh: () {
                    cubit.emitGetAuctionState(
                      auctionId: cubit.thisAuction != null
                          ? cubit.thisAuction!.data.id
                          : "",
                    );
                    return Future.delayed(const Duration(seconds: 2));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 12.0,
                    ),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: AuctionDetailsImagesItem(
                            coverImage:
                                cubit.thisAuction!.data.coverImage.image,
                            images: cubit.thisAuction!.data.images,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(8.0),
                              Text(
                                cubit.thisAuction!.data.title,
                                style: TextStyleManager.font22LightBlackBold,
                              ),
                              verticalSpace(8.0),
                              Text(
                                cubit.thisAuction!.data.description,
                                style: TextStyleManager.font16GrayRegular,
                              ),
                              verticalSpace(12.0),
                              GestureDetector(
                                onTap: () => context.pushNamed(
                                  Routes.artist,
                                  arguments: cubit.thisAuction!.data.artist.id,
                                ),
                                child: ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 6.0,
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: AppNetworkImage(
                                      image: cubit
                                          .thisAuction!.data.artist.profileImg,
                                      width: 45.0,
                                      height: 45.0,
                                    ),
                                  ),
                                  title: Text(
                                    cubit.thisAuction!.data.artist.name,
                                    style: TextStyleManager.font18PurpleRegular,
                                  ),
                                ),
                              ),
                              verticalSpace(8.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Starting Bid",
                                          style: TextStyleManager
                                              .font22LightBlackBold
                                              .copyWith(
                                            fontWeight:
                                                FontWeightManager.regular,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '﹩${context.read<GalleryCubit>().priceOnAuction}',
                                          style: TextStyleManager
                                              .font20DarkPurpleSemiBold,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\t\t\tThis auction has a buyer’s premium.\n\t\t\tShipping, taxes, and additional fees may apply.",
                                      style: TextStyleManager
                                          .font14LightBlackMedium
                                          .copyWith(
                                        color: ColorManager.gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpace(18.0),
                              if (cubit.thisAuction!.data
                                  .userRegisteredInThisAuction)
                                Form(
                                  key: cubit.amountKey,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: AppTextFormField(
                                          hintText: "Bid Amount",
                                          prefixText: "💵\t\t",
                                          controller: context
                                              .read<GalleryCubit>()
                                              .amountController,
                                          validator: (value) =>
                                              amountValidation(
                                            amount: value,
                                            lastAmount: cubit
                                                .thisAuction!.data.price
                                                .toDouble(),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 16.0),
                                          textInputAction: TextInputAction.done,
                                          keyboardType: TextInputType.number,
                                          enabled: cubit.thisAuction!.data
                                              .userRegisteredInThisAuction,
                                        ),
                                      ),
                                      horizontalSpace(12.0),
                                      AppElevatedButton(
                                        onPressed: () {
                                          cubit.emitBidAuctionState(
                                            auctionId:
                                            cubit.thisAuction!.data.id,
                                            bidAmount: cubit.amountController.text,
                                          );
                                          // if (cubit.amountKey.currentState!
                                          //     .validate()) {
                                          //
                                          // }
                                        },
                                        buttonWidth: 60.0,
                                        buttonHeight: 40.0,
                                        borderRadius: 40.0,
                                        child: Text(
                                          "Bid",
                                          style: TextStyleManager
                                              .font20OriginalWhiteSemiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (!cubit.thisAuction!.data
                                  .userRegisteredInThisAuction)
                                Text(
                                  "⚠️ you are not registered in this auction, please register first and bid again",
                                  style: TextStyleManager.font14LightGrayMedium,
                                ),
                              const Divider(
                                indent: 30.0,
                                endIndent: 30.0,
                                color: ColorManager.lighterGray,
                                height: 28.0,
                                thickness: 1.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "↬Auction Information↫",
                                  style: TextStyleManager.font24LightBlackBold,
                                ),
                              ),
                              verticalSpace(8.0),
                              Wrap(
                                spacing: 25.0,
                                children: [
                                  AuctionInfoItem(
                                    title: "Category",
                                    subTitle: cubit.thisAuction!.data.category,
                                  ),
                                  AuctionInfoItem(
                                    title: "Style",
                                    subTitle: cubit.thisAuction!.data.style,
                                  ),
                                  AuctionInfoItem(
                                    title: "Subject",
                                    subTitle: cubit.thisAuction!.data.subject,
                                  ),
                                  AuctionInfoItem(
                                    title: "Material",
                                    subTitle:
                                        cubit.thisAuction!.data.material ??
                                            "unKnown",
                                  ),
                                  AuctionInfoItem(
                                    title: "Size",
                                    subTitle: cubit.thisAuction!.data.size,
                                  ),
                                  AuctionInfoItem(
                                    title: "Began",
                                    subTitle: cubit.thisAuction!.data.began
                                        .split("T")[0],
                                  ),
                                  AuctionInfoItem(
                                    title: "End",
                                    subTitle: cubit.thisAuction!.data.end
                                        .split("T")[0],
                                  ),
                                ],
                              ),
                              if (!cubit.thisAuction!.data
                                  .userRegisteredInThisAuction)
                                verticalSpace(80.0),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  String? amountValidation({required amount, required lastAmount}) {
    if (amount == null || amount.isEmpty) {
      return "Please Enter a valid amount";
    } else if (int.parse(amount) <= int.parse(lastAmount)) {
      return "please enter amount large than last amount";
    } else {
      return null;
    }
  }
}
