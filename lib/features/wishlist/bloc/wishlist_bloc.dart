import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/data/wishlist_item.dart';
import 'package:equatable/equatable.dart';

import '../../home/models/home_product_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<RemoveFromWishListEvent>(removeFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
  emit(WishListSuccessState(wishListItems: wishListItem));
  }

  FutureOr<void> removeFromWishListEvent(RemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    wishListItem.remove(event.productModel);
    emit(WishListSuccessState(wishListItems: wishListItem));
  }
}
