import 'package:art_space_user/core/app_cubit/app_cubit.dart';
import 'package:art_space_user/core/app_cubit/app_state.dart';
import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theming/color_manager.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        Size size = MediaQuery.sizeOf(context);
        AppCubit cubit = context.read<AppCubit>();

        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.all(20.0),
            height: size.width * 0.155,
            decoration: BoxDecoration(
              color: ColorManager.lighterGray.withOpacity(0.9),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.purple.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: cubit.bottomNavBarIcons.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () => cubit.setCurrentPageIndex(index),
                splashColor: ColorManager.transparent,
                highlightColor: ColorManager.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == cubit.currentPageIndex
                            ? 0
                            : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == cubit.currentPageIndex
                          ? size.width * .014
                          : 0,
                      decoration: const BoxDecoration(
                        color: ColorManager.purple,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    ),
                    index == cubit.currentPageIndex
                        ? Text(
                            cubit.bottomNavBarTexts[index],
                            style: TextStyleManager.font16DarkPurpleMedium,
                          )
                        : SvgPicture.asset(
                            cubit.bottomNavBarIcons[index],
                            width: size.width * .078,
                            height: size.width * .078,
                            colorFilter: const ColorFilter.mode(
                              ColorManager.gray,
                              BlendMode.srcIn,
                            ),
                          ),
                    SizedBox(height: size.width * .03),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: cubit.bottomNavBarBody[cubit.currentPageIndex],
          ),
        );
      },
    );
  }
}
