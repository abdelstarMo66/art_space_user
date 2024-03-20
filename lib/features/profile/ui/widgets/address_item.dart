import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SvgPicture.asset(
        AssetsManager.icAddress,
        width: 32.0,
      ),
      title: Text(
        "Qalyubia, Shobra El-Khima",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleManager.font18LightBlackSemiBold,
      ),
      subtitle: Text(
        "16 El-Bostan Street, +201050609664",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleManager.font14LightGrayMedium,
      ),
      trailing: IconButton(
        onPressed: () {
          showAlertDialog(context);
        },
        icon: SvgPicture.asset(AssetsManager.icRemove),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyleManager.font16DarkPurpleMedium,
      ),
      onPressed: () {
        context.pop();
      },
    );

    Widget continueButton = TextButton(
      child: Text(
        "Continue",
        style: TextStyleManager.font16DarkPurpleMedium,
      ),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Remove Address",
        style: TextStyleManager.font20LightBlackBold,
      ),
      content: Text(
        "Are you sure you want to delete this address?",
        style: TextStyleManager.font14LightBlackMedium,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
      backgroundColor: ColorManager.originalWhite,
      elevation: 0.0,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
