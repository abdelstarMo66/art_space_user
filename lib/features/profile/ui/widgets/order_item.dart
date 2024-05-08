import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/font_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/profile/data/models/response/your_orders_response.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class OrderItem extends StatelessWidget {
  final Orders order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.orderDetails, arguments: order.id),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: ColorManager.lighterGray.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: ColorManager.gray.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "OrderID: ",
                            style: TextStyleManager.font18OriginalBlackSemiBold,
                          ),
                          const Spacer(),
                          Gif(
                            image: AssetImage(
                              order.isDelivered
                                  ? AssetsManager.gifDeliveryDone
                                  : AssetsManager.gifDeliveryWait,
                            ),
                            fps: 15,
                            fit: BoxFit.cover,
                            width: 35.0,
                            height: 35.0,
                            autostart: Autostart.loop,
                          ),
                          horizontalSpace(8.0),
                        ],
                      ),
                      Text(
                        order.id,
                        style: TextStyleManager.font18GrayRegular
                            .copyWith(fontSize: FontSizeManager.s14),
                      ),
                      verticalSpace(4.0),
                      Row(
                        children: [
                          Text(
                            order.paymentMethodType,
                            style: TextStyleManager.font20DarkPurpleSemiBold,
                          ),
                          const Spacer(),
                          Text(
                            order.orderState,
                            style: TextStyleManager.font18LightBlackSemiBold,
                          ),
                          horizontalSpace(8.0),
                        ],
                      ),
                      verticalSpace(4.0),
                      Row(
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyleManager.font18LightBlackBold,
                          ),
                          const Spacer(),
                          Text(
                            "\$${order.totalOrderPrice.toDouble()}",
                            style: TextStyleManager.font16DarkPurpleMedium,
                          ),
                          horizontalSpace(14.0),
                        ],
                      ),
                      verticalSpace(4.0),
                    ],
                  ),
                ),
                horizontalSpace(8.0),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      AppNetworkImage(
                        image: order.cartItems[0].product.coverImage.image,
                        height: 125.0,
                      ),
                      if (order.cartItems.length > 1)
                        Container(
                          height: 125.0,
                          color: ColorManager.originalWhite.withOpacity(0.15),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor:
                                  ColorManager.originalWhite.withOpacity(0.7),
                              child: Text(
                                "+${order.cartItems.length - 1}",
                                style:
                                    TextStyleManager.font24OLightBlackSemiBold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (!order.isPaid) ...[
              verticalSpace(12.0),
              Text(
                "you are not pay this order yet",
                style: TextStyleManager.font16GrayRegular,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
