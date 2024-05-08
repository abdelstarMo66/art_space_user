import 'package:art_space_user/features/cart/data/models/response/add_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/create_card_order_response.dart';
import 'package:art_space_user/features/cart/data/models/response/create_cash_order_response.dart';
import 'package:art_space_user/features/cart/data/models/response/delete_cart_response.dart';
import 'package:art_space_user/features/cart/data/models/response/get_cart_response.dart';

abstract class CartStates {}

class InitialCartState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {
  final GetCartResponse getCartResponse;

  GetCartSuccessState(this.getCartResponse);
}

class GetCartFailureState extends CartStates {
  final String message;

  GetCartFailureState(this.message);
}

class AddCartLoadingState extends CartStates {}

class AddCartSuccessState extends CartStates {
  final AddCartResponse addCartResponse;

  AddCartSuccessState(this.addCartResponse);
}

class AddCartFailureState extends CartStates {
  final String message;

  AddCartFailureState(this.message);
}

class DeleteCartLoadingState extends CartStates {}

class DeleteCartSuccessState extends CartStates {
  final DeleteCartResponse deleteCartResponse;

  DeleteCartSuccessState(this.deleteCartResponse);
}

class DeleteCartFailureState extends CartStates {
  final String message;

  DeleteCartFailureState(this.message);
}

class CreateCashOrderLoadingState extends CartStates {}

class CreateCashOrderSuccessState extends CartStates {
  final CreateCashOrderResponse cashOrderResponse;

  CreateCashOrderSuccessState(this.cashOrderResponse);
}

class CreateCashOrderFailureState extends CartStates {
  final String message;

  CreateCashOrderFailureState(this.message);
}

class CreateCardOrderLoadingState extends CartStates {}

class CreateCardOrderSuccessState extends CartStates {
  final CreateCardOrderResponse cardOrderResponse;

  CreateCardOrderSuccessState(this.cardOrderResponse);
}

class CreateCardOrderFailureState extends CartStates {
  final String message;

  CreateCardOrderFailureState(this.message);
}