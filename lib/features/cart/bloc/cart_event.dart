part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductModel productModel ;

  const CartRemoveFromCartEvent({
    required this.productModel,
  });
}