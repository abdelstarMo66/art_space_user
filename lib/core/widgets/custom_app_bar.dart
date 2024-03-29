import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  final Color? bgColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final void Function()? onTap;

  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.bgColor,
    this.systemUiOverlayStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? ColorManager.originalWhite,
      elevation: 0.0,
      systemOverlayStyle: systemUiOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarColor: ColorManager.originalWhite,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
      title: title,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: onTap ??
              () {
                context.pop();
              },
          child: Container(
            decoration: ShapeDecoration(
                color: ColorManager.lighterGray,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
            child: SvgPicture.asset(
              AssetsManager.icArrowLeft,
              width: 65.0,
              height: 65.0,
            ),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
