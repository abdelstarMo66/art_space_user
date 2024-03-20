import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Widget child;
  final VoidCallback onPressed;

  const AppElevatedButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor ?? ColorManager.purple.withOpacity(0.6),
        fixedSize: Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 20),
        minimumSize: const Size(35, 35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 12.0.r),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
