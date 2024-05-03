import 'package:art_space_user/features/gallery/data/models/response/bid_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_all_auctions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_booked_exhibitions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_registered_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/register_auction_response.dart';

abstract class GalleryStates {}

class InitialGalleryState extends GalleryStates {}

class GetAllAuctionsLoadingState extends GalleryStates {}

class GetAllAuctionsSuccessState extends GalleryStates {
  final GetAllAuctionsResponse gerAllAuctionResponse;

  GetAllAuctionsSuccessState(this.gerAllAuctionResponse);
}

class GetAllAuctionsFailureState extends GalleryStates {
  final String message;

  GetAllAuctionsFailureState(this.message);
}

class GetAuctionLoadingState extends GalleryStates {}

class GetAuctionSuccessState extends GalleryStates {
  final GetAuctionResponse getAuctionResponse;

  GetAuctionSuccessState(this.getAuctionResponse);
}

class GetAuctionFailureState extends GalleryStates {
  final String message;

  GetAuctionFailureState(this.message);
}

class BidAuctionLoadingState extends GalleryStates {}

class BidAuctionSuccessState extends GalleryStates {
  final BidAuctionResponse bidAuctionResponse;

  BidAuctionSuccessState(this.bidAuctionResponse);
}

class BidAuctionFailureState extends GalleryStates {
  final String message;

  BidAuctionFailureState(this.message);
}

class BidRefreshState extends GalleryStates {}

class GetBookedExhibitionsLoadingState extends GalleryStates {}

class GetBookedExhibitionsSuccessState extends GalleryStates {
  final GetBookedExhibitionsResponse getBookedExhibitionsResponse;

  GetBookedExhibitionsSuccessState(this.getBookedExhibitionsResponse);
}

class GetBookedExhibitionsFailureState extends GalleryStates {
  final String message;

  GetBookedExhibitionsFailureState(this.message);
}

class GetRegisteredAuctionLoadingState extends GalleryStates {}

class GetRegisteredAuctionSuccessState extends GalleryStates {
  final GetRegisteredAuctionResponse getRegisteredAuctionResponse;

  GetRegisteredAuctionSuccessState(this.getRegisteredAuctionResponse);
}

class GetRegisteredAuctionFailureState extends GalleryStates {
  final String message;

  GetRegisteredAuctionFailureState(this.message);
}

class RegisterAuctionLoadingState extends GalleryStates {}

class RegisterAuctionSuccessState extends GalleryStates {
  final RegisterAuctionResponse registerAuctionResponse;

  RegisterAuctionSuccessState(this.registerAuctionResponse);
}

class RegisterAuctionFailureState extends GalleryStates {
  final String message;

  RegisterAuctionFailureState(this.message);
}
