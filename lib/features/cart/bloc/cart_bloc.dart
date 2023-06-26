import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/data/cart_items.dart';
import 'package:equatable/equatable.dart';

import '../../home/models/home_product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(SuccessState(cartList: cartItem ));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
  cartItem.remove(event.productModel);
  emit(SuccessState(cartList: cartItem));
  }
}
