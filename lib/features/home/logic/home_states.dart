import 'package:art_space_user/features/home/data/models/response/explore_exhibitions_response.dart';
import 'package:art_space_user/features/home/data/models/response/recently_artwork_response.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class ExploreExhibitionsLoading extends HomeStates {}

class ExploreExhibitionsSuccess extends HomeStates {
  final ExploreExhibitionResponse getAllExhibitionsResponse;

  ExploreExhibitionsSuccess(this.getAllExhibitionsResponse);
}

class ExploreExhibitionsFailure extends HomeStates {
  final String message;

  ExploreExhibitionsFailure(this.message);
}

class RecentlyArtworksLoading extends HomeStates {}

class RecentlyArtworksSuccess extends HomeStates {
  final RecentlyArtworksResponse getAllArtworksResponse;

  RecentlyArtworksSuccess(this.getAllArtworksResponse);
}

class RecentlyArtworksFailure extends HomeStates {
  final String message;

  RecentlyArtworksFailure(this.message);
}
