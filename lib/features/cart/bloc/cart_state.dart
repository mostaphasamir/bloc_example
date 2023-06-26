part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

abstract class ActionState extends CartState{}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}
class SuccessState extends CartState {
  final List<ProductModel> cartList ;

  const SuccessState({
    required this.cartList,
  });
}
