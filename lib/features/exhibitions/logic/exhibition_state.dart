import 'package:art_space_user/features/exhibitions/data/models/response/book_exhibition_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_all_exhibitions_response.dart';
import 'package:art_space_user/features/exhibitions/data/models/response/get_exhibition_response.dart';

abstract class ExhibitionStates {}

class ExhibitionInitial extends ExhibitionStates {}

class GetAllExhibitionsLoading extends ExhibitionStates {}

class GetAllExhibitionsSuccess extends ExhibitionStates {
  final GetAllExhibitionResponse getAllExhibitionsResponse;

  GetAllExhibitionsSuccess(this.getAllExhibitionsResponse);
}

class GetAllExhibitionsFailure extends ExhibitionStates {
  final String message;

  GetAllExhibitionsFailure(this.message);
}

class GetExhibitionLoading extends ExhibitionStates {}

class GetExhibitionSuccess extends ExhibitionStates {
  final GetExhibitionResponse getExhibitionResponse;

  GetExhibitionSuccess(this.getExhibitionResponse);
}

class GetExhibitionFailure extends ExhibitionStates {
  final String message;

  GetExhibitionFailure(this.message);
}

class BookExhibitionLoading extends ExhibitionStates {}

class BookExhibitionSuccess extends ExhibitionStates {
  final BookExhibitionResponse bookExhibitionResponse;

  BookExhibitionSuccess(this.bookExhibitionResponse);
}

class BookExhibitionFailure extends ExhibitionStates {
  final String message;

  BookExhibitionFailure(this.message);
}
