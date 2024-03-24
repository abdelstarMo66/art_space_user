import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/app_network_image.dart';

class ArtworkDetailsImagesItem extends StatefulWidget {
  const ArtworkDetailsImagesItem({super.key});

  @override
  State<ArtworkDetailsImagesItem> createState() =>
      _ArtworkDetailsImagesItemState();
}

class _ArtworkDetailsImagesItemState extends State<ArtworkDetailsImagesItem> {
  List<String> images = const [
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-3_dxf4y_1708897626.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-4_hb1cb_1198421618.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-5_2vons_1378185781.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-7_46uuy_615146404.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_white-frame-tight-crop_ffgu5_1028893237.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_white-frame-tight-crop-ra-crop_2hcss_2109152326.jpg",
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child:
                AppNetworkImage(image: images[index], width: double.maxFinite),
          ),
          options: CarouselOptions(
            viewportFraction: 0.96,
            initialPage: 0,
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollPhysics: const BouncingScrollPhysics(),
            height: 300.0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.6,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, page) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        verticalSpace(10.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < images.length; i++) ...[
              AnimatedContainer(
                duration: const Duration(milliseconds: 1200),
                curve: Curves.elasticInOut,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: i == _currentIndex ? 10.0 : 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                      color: i == _currentIndex
                          ? ColorManager.purple
                          : ColorManager.originalWhite,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          color: i == _currentIndex
                              ? ColorManager.purple
                              : Colors.black,
                          width: 0.8)),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class ArtworkDetailsImagesItem2 extends StatefulWidget {
  const ArtworkDetailsImagesItem2({super.key});

  @override
  State<ArtworkDetailsImagesItem2> createState() =>
      _ArtworkDetailsImagesItem2State();
}

class _ArtworkDetailsImagesItem2State extends State<ArtworkDetailsImagesItem2>
    with TickerProviderStateMixin {
  List<String> images = const [
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-3_dxf4y_1708897626.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-4_hb1cb_1198421618.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-5_2vons_1378185781.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_detail-7_46uuy_615146404.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_white-frame-tight-crop_ffgu5_1028893237.jpg",
    "https://cdn.kreezalid.com/kreezalid/556408/catalog/8096/27/1000x1000_white-frame-tight-crop-ra-crop_2hcss_2109152326.jpg",
  ];
  int selectedImage = 0;
  late AnimationController fadeAnimation;

  @override
  void initState() {
    super.initState();
    fadeAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: AppNetworkImage(
              image: images[selectedImage],
              width: double.infinity,
            ),
          ),
        ),
        verticalSpace(8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < images.length; i++) ...[
                if (i != selectedImage)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = i;
                        fadeAnimation = AnimationController(
                          vsync: this,
                          duration: const Duration(milliseconds: 800),
                        )..forward();
                      });
                    },
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AppNetworkImage(
                          image: images[i],
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
