import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/notification/ui/widgets/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffold,
      appBar: CustomAppBar(
        title: Text(
          "Notifications",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            NotificationItem(isRead: index > 3 ? true : false),
        separatorBuilder: (context, index) => verticalSpace(12.0),
        itemCount: 8,
      ),
      // body: NoThingWidget(),
    );
  }
}
