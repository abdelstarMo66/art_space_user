import 'package:art_space_user/core/di/dependency_injection.dart';
import 'package:art_space_user/core/helpers/extensions.dart';
import 'package:art_space_user/core/helpers/spacing.dart';
import 'package:art_space_user/features/home/logic/home_cubit.dart';
import 'package:art_space_user/features/home/ui/widgets/explore_exhibitions.dart';
import 'package:art_space_user/features/home/ui/widgets/header.dart';
import 'package:art_space_user/features/home/ui/widgets/recently_artworks_list.dart';
import 'package:art_space_user/features/home/ui/widgets/search.dart';
import 'package:art_space_user/features/home/ui/widgets/title_of_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..emitExploreExhibitions()
        ..emitRecentlyArtworks(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomScrollView(
          slivers: [
            const Header(),
            SliverToBoxAdapter(child: verticalSpace(16.0)),
            const Search(),
            SliverToBoxAdapter(child: verticalSpace(20.0)),
            TitleOfList(
              title: "Explore Exhibitions",
              onTap: () => context.pushNamed(Routes.exhibitions),
            ),
            const ExploreExhibitions(),
            SliverToBoxAdapter(child: verticalSpace(20.0)),
            TitleOfList(
              title: "Recently Artworks",
              onTap: () => context.pushNamed(Routes.artworks),
            ),
            const RecentlyArtworksList(),
            SliverToBoxAdapter(child: verticalSpace(85.0)),
          ],
        ),
      ),
    );
  }
}
