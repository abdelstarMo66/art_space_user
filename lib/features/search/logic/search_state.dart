import 'package:art_space_user/features/search/data/models/response/search_response.dart';

abstract class SearchStates {}

final class SearchInitial extends SearchStates {}

final class SearchLoadingState extends SearchStates {}

final class SearchSuccessState extends SearchStates {
  final SearchResponse searchResponse;

  SearchSuccessState(this.searchResponse);
}

final class SearchFailureState extends SearchStates {
  final String message;

  SearchFailureState(this.message);
}
