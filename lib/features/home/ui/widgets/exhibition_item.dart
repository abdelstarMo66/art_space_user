import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';

class ExhibitionItem extends StatelessWidget {
  const ExhibitionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      color: ColorManager.moreLightGray,
      elevation: 0.0,
      shadowColor: ColorManager.dartPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(8.0),
                topEnd: Radius.circular(8.0),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://blog.artweb.com/wp-content/uploads/2020/11/Royal-Academy-Summer-64-David-Parry-provided-by-organizers-600x400.jpg",
                width: double.maxFinite,
                height: 160.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Augmented Empathy",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleManager.font20LightBlackBold,
                        ),
                        verticalSpace(4.0),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AssetsManager.icTime,
                              width: 20.0,
                              height: 20.0,
                                colorFilter:
                                const ColorFilter.mode(ColorManager.dartGray, BlendMode.srcIn),
                            ),
                            horizontalSpace(2.0),
                            Text(
                              "12 days",
                              style: TextStyleManager.font16DarkPurpleSemiBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: SvgPicture.asset(AssetsManager.icAdd),
                    // ),
                  ],
                ),
                verticalSpace(4.0),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManager.icCalender,
                      width: 20.0,
                      height: 20.0,
                        colorFilter:
                        const ColorFilter.mode(ColorManager.dartGray, BlendMode.srcIn),
                    ),
                    horizontalSpace(2.0),
                    Text(
                      "12/05/2024",
                      style: TextStyleManager.font16DarkPurpleSemiBold,
                    ),
                    const Spacer(),
                    Text(
                      "Elizabete Caires",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleManager.font16DarkPurpleSemiBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
