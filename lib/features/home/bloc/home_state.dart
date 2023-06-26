part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}
abstract class HomeActionState extends HomeState{

}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductModel> product ;

 const HomeLoadedSuccessState({required this.product});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageState extends HomeActionState {}

class HomeNavigateToCartPageState extends HomeActionState {}

class HomeProductWishListActionState extends HomeActionState{}

class HomeProductCartActionState extends HomeActionState{}
