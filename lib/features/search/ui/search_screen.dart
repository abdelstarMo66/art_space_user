import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/widgets/custom_app_bar.dart';
import 'package:art_space_user/features/search/ui/widgets/artist_search_list.dart';
import 'package:art_space_user/features/search/ui/widgets/artwork_search_list.dart';
import 'package:art_space_user/features/search/ui/widgets/exhibition_search_list.dart';
import 'package:art_space_user/features/search/ui/widgets/search_tap_bar.dart';
import 'package:art_space_user/features/search/ui/widgets/search_text_form.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  int pIndex = 0;
  late TabController _tabController;
  final PageController _pageController = PageController();

  List<Widget> searchBodyView = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorManager.scaffold,
        appBar: const CustomAppBar(),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                child: SearchTextForm(),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  SearchTapBar(
                    tabController: _tabController,
                    pageController: _pageController,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 3,
                      onPageChanged: (index) {
                        _tabController.animateTo(index);
                      },
                      itemBuilder: (context, index) => index == 0
                          ? const ArtworkSearchList()
                          : index == 1
                              ? const ExhibitionSearchList()
                              : const ArtistSearchList(),
                    ),
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
