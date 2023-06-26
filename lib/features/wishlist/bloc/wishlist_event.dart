part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WishListInitialEvent extends WishlistEvent {}

class RemoveFromWishListEvent extends WishlistEvent {
 final ProductModel productModel ;

 const RemoveFromWishListEvent({
    required this.productModel,
  });
}
