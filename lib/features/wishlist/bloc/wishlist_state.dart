part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

abstract class WishListActionState extends WishlistState {}

class WishlistInitial extends WishlistState {
  @override
  List<Object> get props => [];


}

class WishListInitialState extends WishlistInitial {}


class WishListSuccessState extends WishlistState {
  final List<ProductModel> wishListItems ;

  const WishListSuccessState({
    required this.wishListItems,
  });
}
