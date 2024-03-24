import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../utils/assets_manager.dart';

class NoThingWidget extends StatefulWidget {
  const NoThingWidget({super.key});

  @override
  State<NoThingWidget> createState() => _NoThingWidgetState();
}

class _NoThingWidgetState extends State<NoThingWidget>
    with TickerProviderStateMixin {
  late GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.originalWhite,
      child: Center(
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
