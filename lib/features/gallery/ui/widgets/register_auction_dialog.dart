import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/widgets/app_elevated_button.dart';
import 'package:art_space_user/features/gallery/logic/gallery_cubit.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:flutter/material.dart';

class RegisterAuctionDialog extends StatelessWidget {
  final GalleryCubit cubit;

  const RegisterAuctionDialog({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: ColorManager.originalWhite,
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
          left: 18.0,
          right: 18.0,
          bottom: 12.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "you are not registered in this auction, please register first and bid again",
              style: TextStyleManager.font18LightBlackSemiBold,
            ),
            verticalSpace(18.0),
            Row(
              children: [
                Expanded(
                  child: AppElevatedButton(
                    onPressed: () {
                      context.pop();
                      cubit.emitRegisterAuctionState(
                          auctionId: cubit.thisAuction!.data.id);
                    },
                    backgroundColor: ColorManager.purple,
                    child: Text(
                      "Confirm",
                      style: TextStyleManager.font20OriginalWhiteSemiBold,
                    ),
                  ),
                ),
                horizontalSpace(12.0),
                Expanded(
                  child: AppElevatedButton(
                    onPressed: () => context.pop(),
                    backgroundColor: ColorManager.dartGray,
                    child: Text(
                      "Cancel",
                      style: TextStyleManager.font20OriginalWhiteSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}