import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../../core/widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  late GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Notifications",
          style: TextStyleManager.font24OLightBlackSemiBold,
        ),
      ),
      body: Center(
        child: Gif(
          image: const AssetImage(AssetsManager.gifOne),
          controller: controller,
          fps: 15,
          fit: BoxFit.cover,
          width: 300.0,
          height: 300.0,
          autostart: Autostart.loop,
          onFetchCompleted: () {
            controller.reset();
            controller.forward();
          },
        ),
      ),
    );
  }
}
