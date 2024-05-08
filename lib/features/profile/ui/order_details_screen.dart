import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/profile/logic/profile_cubit.dart';
import 'package:art_space_user/features/profile/logic/profile_state.dart';
import 'package:art_space_user/features/profile/ui/widgets/cart_items.dart';
import 'package:art_space_user/features/profile/ui/widgets/delivered_info.dart';
import 'package:art_space_user/features/profile/ui/widgets/order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: AnimatedOpacity(
              opacity: state is YourOrderSuccessState ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Text(
                state is YourOrderSuccessState
                    ? state.yourOrdersResponse.data.id
                    : " ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleManager.font14LightBlackMedium,
              ),
            ),
          ),
          body: state is YourOrderSuccessState
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            horizontalSpace(12.0),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Order Information",
                                  style: TextStyleManager.font22LightBlackBold,
                                ),
                              ),
                            ),
                            Gif(
                              image: AssetImage(
                                state.yourOrdersResponse.data.isDelivered
                                    ? AssetsManager.gifDeliveryDone
                                    : AssetsManager.gifDeliveryWait,
                              ),
                              fps: 15,
                              fit: BoxFit.cover,
                              width: 35.0,
                              height: 35.0,
                              autostart: Autostart.loop,
                            ),
                            horizontalSpace(12.0),
                          ],
                        ),
                      ),
                      OrderInfo(order: state.yourOrdersResponse.data,),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const Divider(
                              height: 25.0,
                              color: ColorManager.lighterGray,
                              thickness: 1.0,
                            ),
                            Text(
                              "Delivered Information",
                              style: TextStyleManager.font22LightBlackBold,
                            ),
                          ],
                        ),
                      ),
                      DeliveredInfo(address: state.yourOrdersResponse.data.shippingAddress),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const Divider(
                              height: 25.0,
                              color: ColorManager.lighterGray,
                              thickness: 1.0,
                            ),
                            Text(
                              "Cart Items",
                              style: TextStyleManager.font22LightBlackBold,
                            ),
                            verticalSpace(12.0),
                          ],
                        ),
                      ),
                      CartItems(products: state.yourOrdersResponse.data.cartItems),
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
