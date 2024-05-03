import 'package:art_space_user/core/widgets/no_thing.dart';
import 'package:art_space_user/features/artworks/data/models/all_artwork_model.dart';
import 'package:art_space_user/features/search/logic/search_cubit.dart';
import 'package:art_space_user/features/search/logic/search_state.dart';
import 'package:art_space_user/features/search/ui/widgets/search_artwork_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../artworks/ui/widgets/artwork_item.dart';

class ArtworkSearchList extends StatelessWidget {
  const ArtworkSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return state.searchResponse.data.products.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 12.0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => SearchArtworkItem(
                    imageHeight: 180.0,
                    artwork:  state.searchResponse.data.products[index],
                  ),
                  separatorBuilder: (context, index) => verticalSpace(20.0),
                  itemCount: state.searchResponse.data.products.length,
                )
              : const NoThingWidget();
        } else if (state is SearchLoadingState) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: ColorManager.purple, size: 80.0),
          );
        } else {
          return const NoThingWidget();
        }
      },
    );
  }
}
