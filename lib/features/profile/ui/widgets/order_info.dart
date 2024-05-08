import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/features/profile/data/models/response/your_order_response.dart';
import 'package:art_space_user/features/profile/ui/widgets/order_info_item.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  final Order order;

  const OrderInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: BoxDecoration(
          color: ColorManager.lighterGray.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderInfoItem(
              title: "Order ID",
              subTitle: order.id,
            ),
            OrderInfoItem(
              title: "Total Order Price",
              subTitle: "\$${order.totalOrderPrice.toDouble()}",
            ),
            OrderInfoItem(
              title: "Payment Type",
              subTitle: order.paymentMethodType,
            ),
            OrderInfoItem(
              title: "Order State",
              subTitle: order.orderState,
            ),
            if(!order.isPaid)
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  "you are not pay this order yet",
                  style: TextStyleManager.font16GrayRegular,
                ),
              ),
            if (order.paidAt != null)
              OrderInfoItem(
                title: "Paid At",
                subTitle: order.paidAt!,
              ),
            if (order.deliveredAt != null)
              OrderInfoItem(
                title: "Delivered At",
                subTitle: order.deliveredAt!,
              ),
          ],
        ),
      ),
    );
  }
}
