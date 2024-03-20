import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_text_button.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/profile/ui/widgets/address_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/color_manager.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Address Book",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) =>
                const AddressItem(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: AppTextButton(
                backgroundColor: ColorManager.lighterGray,
                borderRadius: 12.0,
                buttonText: "Add New Address",
                textStyle: TextStyleManager.font18LightBlackSemiBold,
                onPressed: () {
                  context.pushNamed(Routes.addAddress);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}