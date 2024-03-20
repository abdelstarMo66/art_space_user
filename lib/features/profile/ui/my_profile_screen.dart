import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/profile/ui/widgets/profile_form.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/custom_app_bar.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Card(
                    shadowColor: ColorManager.dartPurple,
                    elevation: 2.0,
                    margin: EdgeInsets.zero,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://img.freepik.com/premium-psd/man-with-white-shirt-that-says-smile-face_410516-124514.jpg?w=740",
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: ColorManager.dartPurple,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(16.0),
                        topStart: Radius.circular(16.0),
                      ),
                    ),
                    child: SvgPicture.asset(
                      AssetsManager.icEdit,
                      width: 28.0,
                      height: 28.0,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.lighterGray,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const ProfileForm(),
          ],
        ),
      ),
    );
  }
}
