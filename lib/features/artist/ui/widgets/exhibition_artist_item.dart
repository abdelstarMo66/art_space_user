import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/artist/data/models/response/artist_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExhibitionArtistItem extends StatelessWidget {
  final Exhibition exhibitionInfo;

  const ExhibitionArtistItem({super.key, required this.exhibitionInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 250.0,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          color: ColorManager.moreLightGray,
          elevation: 0.0,
          shadowColor: ColorManager.dartPurple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
                              style: TextStyleManager.font16DarkPurpleSemiBold,
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
                          exhibitionInfo.began.split("T")[0],
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
      ),
    );
  }
}
