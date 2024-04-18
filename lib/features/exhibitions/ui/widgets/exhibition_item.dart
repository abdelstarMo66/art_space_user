import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../data/models/response/get_all_exhibitions_response.dart';

class ExhibitionItem extends StatelessWidget {
  final Exhibition exhibitionInfo;
  final int index;

  const ExhibitionItem({
    super.key,
    required this.index,
    required this.exhibitionInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.exhibitionDetails,
        arguments: exhibitionInfo.id,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        color: ColorManager.moreLightGray,
        elevation: 0.3,
        shadowColor: ColorManager.dartPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(index % 2 == 0 ? 52.0 : 0.0),
            topStart: Radius.circular(index % 2 == 0 ? 0.0 : 52.0),
            bottomEnd: const Radius.circular(52.0),
            bottomStart: const Radius.circular(52.0),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(index % 2 == 0 ? 52.0 : 0.0),
                topStart: Radius.circular(index % 2 == 0 ? 0.0 : 52.0),
                bottomEnd: const Radius.circular(52.0),
                bottomStart: const Radius.circular(52.0),
              ),
              child: AppNetworkImage(
                image: exhibitionInfo.coverImage,
                height: 240.0,
                width: double.maxFinite,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.white70.withOpacity(0.9),
                //     Colors.white70.withOpacity(0.6),
                //     Colors.white70.withOpacity(0.3),
                //     Colors.white70.withOpacity(0.0),
                //   ],
                //   begin: Alignment.center,
                //   end: Alignment.topCenter,
                //   stops: const [0.1, 0.3, 0.5, 0.7],
                // ),
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(52.0),
                  bottomRight: Radius.circular(52.0),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 2.0,
                bottom: 8.0,
                right: 12.0,
                left: 12.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exhibitionInfo.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleManager.font20LightBlackBold,
                      ),
                      verticalSpace(4.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsManager.icTime,
                                  width: 20.0,
                                  height: 20.0,
                                  colorFilter: const ColorFilter.mode(
                                      ColorManager.dartGray, BlendMode.srcIn),
                                ),
                                horizontalSpace(2.0),
                                Text(
                                  "${exhibitionInfo.duration} days",
                                  style:
                                      TextStyleManager.font16DarkPurpleSemiBold,
                                ),
                              ],
                            ),
                            verticalSpace(4.0),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsManager.icCalender,
                                  width: 20.0,
                                  height: 20.0,
                                  colorFilter: const ColorFilter.mode(
                                    ColorManager.dartGray,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                horizontalSpace(2.0),
                                Text(
                                  exhibitionInfo.began.split("T")[0],
                                  style:
                                      TextStyleManager.font16DarkPurpleSemiBold,
                                ),
                                const Spacer(),
                                Text(
                                  exhibitionInfo.owner.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyleManager.font16DarkPurpleSemiBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
