import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/font_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/core/widgets/app_text_form_field.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:art_space_user/features/gallery/ui/widgets/auction_details_images_item.dart';
import 'package:art_space_user/features/gallery/ui/widgets/auction_info_item.dart';
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
          body: cubit.thisAuction != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 12.0,
                  ),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: AuctionDetailsImagesItem(
                          coverImage: cubit.thisAuction!.data.coverImage.image,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
                                          fontWeight: FontWeightManager.regular,
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
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextFormField(
                                    hintText: "Bid Amount",
                                    prefixText: "💵\t\t",
                                    controller: context
                                        .read<GalleryCubit>()
                                        .amountController,
                                    validator: (value) {},
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                horizontalSpace(12.0),
                                AppElevatedButton(
                                  onPressed: () {},
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
                              spacing: 42.0,
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
                                  subTitle: cubit.thisAuction!.data.material ??
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
                                  subTitle:
                                      cubit.thisAuction!.data.end.split("T")[0],
                                ),
                                // AuctionInfoItem(
                                //   title: "Launch",
                                //   subTitle: state
                                //           .getAuctionResponse.data.isLaunch
                                //       ? "Now"
                                //       : "after ${DateTime.now().difference(DateTime.parse(cubit.thisAuction!.data.began)).inDays.abs()} days",
                                // ),
                              ],
                            ),
                            verticalSpace(30.0),
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
