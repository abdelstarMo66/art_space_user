import 'package:art_space_user/core/networking/local/prefs_manager.dart';
import 'package:art_space_user/core/networking/local/shared_preferences.dart';
import 'package:art_space_user/core/networking/remote/api_error_handler.dart';
import 'package:art_space_user/features/cart/data/models/response/add_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/create_card_order_response.dart';
import 'package:art_space_user/features/cart/data/models/response/create_cash_order_response.dart';
import 'package:art_space_user/features/cart/data/models/response/delete_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/get_cart_response.dart';
import 'package:art_space_user/features/cart/data/repos/cart_repo.dart';
import 'package:art_space_user/features/cart/logic/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(InitialCartState());

  List<CartItem> cartItems = [];
  String? cartId;

  void emitGetCartState() async {
    cartId = null;
    cartItems = [];
    emit(GetCartLoadingState());

    final cart = await _cartRepo.getCart(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    cart.when(
      success: (GetCartResponse response) {
        cartItems = response.data.cartItems;
        cartId = response.data.id;
        emit(GetCartSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(GetCartFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitAddProductToCartState(String productId) async {
    emit(AddCartLoadingState());

    final cart = await _cartRepo.addCart(
      productId: productId,
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
    );

    cart.when(
      success: (AddCartResponse response) {
        emit(AddCartSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(AddCartFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitRemoveProductFromCartState(String productId) async {
    emit(DeleteCartLoadingState());

    final cart = await _cartRepo.deleteCart(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      productId: productId,
    );

    cart.when(
      success: (DeleteCartResponse response) {
        emit(DeleteCartSuccessState(response));
        emitGetCartState();
      },
      failure: (ErrorHandler error) {
        emit(DeleteCartFailureState(error.apiErrorModel.message));
      },
    );
  }

  void emitCreateCashOrderState({
    required String cartId,
    required String addressId,
  }) async {
    emit(CreateCashOrderLoadingState());

    final order = await _cartRepo.createCashOrder(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      cartId: cartId,
      shippingAddressId: addressId,
    );

    order.when(
      success: (CreateCashOrderResponse response) {
        emitGetCartState();
        emit(CreateCashOrderSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(CreateCashOrderFailureState(error.apiErrorModel.message));
      },
    );
  }

  emitCreateCardOrderState({
    required String cartId,
    required String addressId,
  }) async {
    emit(CreateCardOrderLoadingState());

    final order = await _cartRepo.createCardOrder(
      token: SharedPreferencesManager.getData(key: PrefsManager.token),
      cartId: cartId,
      shippingAddressId: addressId,
    );

    order.when(
      success: (CreateCardOrderResponse response) {
        emitGetCartState();
        emit(CreateCardOrderSuccessState(response));
      },
      failure: (ErrorHandler error) {
        emit(CreateCardOrderFailureState(error.apiErrorModel.message));
      },
    );
  }
}
