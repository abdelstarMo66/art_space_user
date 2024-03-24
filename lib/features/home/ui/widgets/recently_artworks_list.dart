import 'package:art_space_user/features/home/ui/widgets/home_artwork_item.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecentlyArtworksList extends StatefulWidget {
  const RecentlyArtworksList({super.key});

  @override
  State<RecentlyArtworksList> createState() => _RecentlyArtworksListState();
}

class _RecentlyArtworksListState extends State<RecentlyArtworksList> {
  GlobalKey<SliverAnimatedListState> listKey =
      GlobalKey<SliverAnimatedListState>();
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: listKey,
      initialItemCount: itemCount,
      itemBuilder: (context, index, animation) {
        return VisibilityDetector(
          onVisibilityChanged: (VisibilityInfo info) {
            if (itemCount < 10) {
              if (index == itemCount - 1) {
                listKey.currentState!.insertItem(
                  index,
                  duration: const Duration(milliseconds: 1200),
                );
                itemCount += 1;
              }
            }
          },
          key: Key(index.toString()),
          child: FadeTransition(
            opacity: animation,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: HomeArtworkItem(),
            ),
          ),
        );
      },
    );
  }
}
