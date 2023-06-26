import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/data/cart_items.dart';
import 'package:bloc_example/data/grocery_data.dart';
import 'package:bloc_example/data/wishlist_item.dart';
import 'package:equatable/equatable.dart';

import '../models/home_product_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListButtonNavigateClickedEvent>(
        homeWishListButtonNavigateClickedEvent);
    on<HomeCartButtonNavigateClickedEvent>(homeCartButtonNavigateClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
      product: GroceryData.groceryData
          .map(
            (e) => ProductModel(
              id: e['id'],
              name: e['name'],
              description: e["description"],
              price: e["price"],
              imageURL: e["imageURL"],
              quantity: e['quantity'],
              category: e['category'],
            ),
          )
          .toList(),
    ));
  }

  FutureOr<void> homeWishListButtonNavigateClickedEvent(
      HomeWishListButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListPageState());
  }

  FutureOr<void> homeCartButtonNavigateClickedEvent(
      HomeCartButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageState());
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    wishListItem.add(event.productModel);
    emit(HomeProductWishListActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItem.add(event.productModel);
    emit(HomeProductCartActionState());
  }

}
