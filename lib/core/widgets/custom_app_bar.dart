import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;

  const CustomAppBar({super.key, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.originalWhite,
      elevation: 0.0,
      title: title,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () => context.pop(),
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
