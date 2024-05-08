import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/features/profile/data/models/response/your_order_response.dart';
import 'package:art_space_user/features/profile/ui/widgets/order_info_item.dart';
import 'package:flutter/material.dart';

class DeliveredInfo extends StatelessWidget {
  final ShippingAddress address;

  const DeliveredInfo({super.key, required this.address});

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
              title: "Address Type",
              subTitle: address.alias,
            ),
            OrderInfoItem(
              title: "street",
              subTitle: address.street,
            ),
            OrderInfoItem(
              title: "region",
              subTitle: address.region,
            ),
            OrderInfoItem(
              title: "city",
              subTitle: address.city,
            ),
            OrderInfoItem(
              title: "country",
              subTitle: address.country,
            ),
            if (address.postalCode != null && address.postalCode! != "")
              OrderInfoItem(
                title: "postalCode",
                subTitle: address.postalCode!,
              ),
            if (address.phone != null && address.phone! != "")
              OrderInfoItem(
                title: "phone",
                subTitle: address.phone!,
              ),
          ],
        ),
      ),
    );
  }
}
