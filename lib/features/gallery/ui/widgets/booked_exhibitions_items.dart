import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/core/widgets/app_network_image.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_booked_exhibitions_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';

class BookedExhibitionsItem extends StatelessWidget {
  final BookedExhibition bookedExhibition;

  const BookedExhibitionsItem({super.key, required this.bookedExhibition});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.exhibitionDetails,
        arguments: bookedExhibition.id,
      ),
      child: Card(
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
                child: AppNetworkImage(
                  image: bookedExhibition.coverImage ?? "",
                  width: double.maxFinite,
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
                            bookedExhibition.title,
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
                                colorFilter: const ColorFilter.mode(
                                    ColorManager.dartGray, BlendMode.srcIn),
                              ),
                              horizontalSpace(2.0),
                              Text(
                                "${bookedExhibition.duration} days",
                                style:
                                    TextStyleManager.font16DarkPurpleSemiBold,
                              ),
                            ],
                          ),
                        ],
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
                            ColorManager.dartGray, BlendMode.srcIn),
                      ),
                      horizontalSpace(2.0),
                      Text(
                        bookedExhibition.began.split("T")[0],
                        style: TextStyleManager.font16DarkPurpleSemiBold,
                      ),
                      const Spacer(),
                      Text(
                        bookedExhibition.ownerName,
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
      ),
    );
  }
}
