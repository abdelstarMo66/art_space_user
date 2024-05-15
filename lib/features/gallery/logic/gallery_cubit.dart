import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/core/utils/socket_io_init.dart';
import 'package:art_space_user/features/gallery/data/models/bid_model.dart';
import 'package:art_space_user/features/gallery/data/models/response/bid_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_all_auctions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_booked_exhibitions_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/get_registered_auction_response.dart';
import 'package:art_space_user/features/gallery/data/models/response/register_auction_response.dart';
import 'package:art_space_user/features/gallery/data/repos/gallery_repo.dart';
import 'package:art_space_user/features/gallery/logic/gallery_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryCubit extends Cubit<GalleryStates> {
  final GalleryRepo _galleryRepo;

  GalleryCubit(this._galleryRepo) : super(InitialGalleryState());
  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> amountKey = GlobalKey<FormState>();
  List<Auction> allAuctions = [];
  List<BookedExhibition> bookedExhibitions = [];
  bool loadAllRegisteredAuction = true;
  List<RegisteredAuction> registeredAuction = [];
  GetAuctionResponse? thisAuction;
  late String priceOnAuction;

  void emitGetAllAuctionsState({int? page, int? limit}) async {
    emit(GetAllAuctionsLoadingState());

    final auctions = await _galleryRepo.getAllAuctions(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      page: page,
      limit: limit,
    );

    auctions.when(
      success: (GetAllAuctionsResponse response) {
        allAuctions = response.data.auctions;
        emit(GetAllAuctionsSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(GetAllAuctionsFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitGetAuctionState({required String auctionId}) async {
    emit(GetAuctionLoadingState());
    initSocket();

    final auction = await _galleryRepo.getAuction(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      auctionId: auctionId,
    );

    auction.when(
      success: (GetAuctionResponse response) {
        amountController.text = response.data.price.toString();
        thisAuction = response;
        priceOnAuction = response.data.price.toString();
        emit(GetAuctionSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(GetAuctionFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitBidAuctionState({
    required String auctionId,
    required String bidAmount,
  }) async {
    emit(BidAuctionLoadingState());

    final auction = await _galleryRepo.bidAuction(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      auctionId: auctionId,
      bidAmount: bidAmount,
    );

    auction.when(
      success: (BidAuctionResponse response) {
        emit(BidAuctionSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(BidAuctionFailureState(error.apiErrorModel.message));
      },
    );
  }

  String? getAuctionPriceOnSocket() {
    if (socket != null) {
      socket!.on("Bid", (data) {
        BidModel eventData = BidModel.fromJson(data);
        priceOnAuction = eventData.price.toString();
        amountController.text = eventData.price.toString();
        emit(BidRefreshState());
        return eventData.price.toString();
      });
    }

    return null;
  }

  void emitGetBookedExhibitionState() async {
    emit(GetBookedExhibitionsLoadingState());

    final auctions = await _galleryRepo.getBookedExhibitions(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    auctions.when(
      success: (GetBookedExhibitionsResponse response) {
        bookedExhibitions = response.data.exhibitions;
        emit(GetBookedExhibitionsSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(GetBookedExhibitionsFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitGetRegisteredAuctionState() async {
    emit(GetRegisteredAuctionLoadingState());
    registeredAuction = [];
    loadAllRegisteredAuction = true;

    final auctions = await _galleryRepo.getRegisteredAuction(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    auctions.when(
      success: (GetRegisteredAuctionResponse response) {
        registeredAuction = response.data.auctions;
        loadAllRegisteredAuction = false;
        emit(GetRegisteredAuctionSuccessState(response));
      },
      failure: (ErrorHandler error) {
        loadAllRegisteredAuction = false;
        emit(GetRegisteredAuctionFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitRegisterAuctionState({required String auctionId}) async {
    emit(RegisterAuctionLoadingState());

    final auction = await _galleryRepo.registerAuction(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      auctionId: auctionId,
    );

    auction.when(
      success: (RegisterAuctionResponse response) {
        emit(RegisterAuctionSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(RegisterAuctionFailureState(error.apiErrorModel.message));
      },
    );
  }
}
