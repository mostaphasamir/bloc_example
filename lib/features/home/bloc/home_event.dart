part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductModel productModel ;

  const HomeProductWishListButtonClickedEvent(this.productModel);
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel productModel ;

  const HomeProductCartButtonClickedEvent(this.productModel);
}

class HomeWishListButtonNavigateClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateClickedEvent extends HomeEvent {}
