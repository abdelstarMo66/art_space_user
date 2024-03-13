import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/routing/routes.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/onboarding/ui/widgets/indicator_with_next_button.dart';
import 'package:art_space_user/features/onboarding/ui/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_text_button.dart';
import '../models/page_view_item_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late CrossFadeState _crossFadeState;
  int pageIndex = 0;
  double currentPageValue = 0.0;
  List<PageViewItemModel> onboardingItems = const [
    PageViewItemModel(
        title: "Virtual Space For Exhibiting And Selling Work",
        image: AssetsManager.imgOnboardingPage1),
    PageViewItemModel(
        title:
            "We Were The First Auction House to Host a Digital Art Sale in Africa",
        image: AssetsManager.imgOnboardingPage2),
    PageViewItemModel(
        title: "Everyone In World Can Engage With And Buy The Art Online",
        image: AssetsManager.imgOnboardingPage3),
    PageViewItemModel(
        title: "Try The Product Before Buy It Using AR Technology",
        image: AssetsManager.imgOnboardingPage4),
  ];

  @override
  void initState() {
    super.initState();
    prepareInit();
  }

  void prepareInit() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
      });
    });

    _crossFadeState = CrossFadeState.showFirst;

    SharedPreferencesManager.saveData(key: PrefsManager.onboarding, value: true)
        .then((value) => {debugPrint("onBoarding $value")});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (pageIndex != onboardingItems.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextButton(
                onPressed: () => context.pushReplacementNamed(Routes.login),
                child: Text(
                  'Skip',
                  style: TextStyleManager.font18DarkBlueSemiBold,
                ),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int page) {
                  setState(() {
                    pageIndex = page;
                    if (pageIndex == onboardingItems.length - 1) {
                      _crossFadeState = CrossFadeState.showSecond;
                    } else {
                      _crossFadeState = CrossFadeState.showFirst;
                    }
                  });
                },
                controller: _pageController,
                itemCount: onboardingItems.length,
                itemBuilder: (BuildContext context, int index) =>
                    PageViewItem(item: onboardingItems[index]),
              ),
            ),
            AnimatedCrossFade(
              firstChild:
                  IndicatorWithNextButton(pageController: _pageController),
              secondChild: AppTextButton(
                buttonText: "Get Started",
                buttonHeight: 60,
                textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
                onPressed: () => context.pushReplacementNamed(Routes.register),
              ),
              crossFadeState: _crossFadeState,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
