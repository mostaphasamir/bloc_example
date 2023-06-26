import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/screens/cart_screen.dart';
import '../../wishlist/screens/wishlist_screen.dart';
import '../bloc/home_bloc.dart';
import '../widgets/prduct_widget.dart';


class Home extends StatelessWidget {
   Home({super.key});

  final HomeBloc homeBloc = HomeBloc()..add(HomeInitialEvent());


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  CartScreen(),
              ));
        } else if (state is HomeNavigateToWishListPageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  WishListScreen(),
              ));
        } else if (state is HomeProductWishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added successfly")));
        } else if (state is HomeProductCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart successfly")));

        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Grocery Store"),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeWishListButtonNavigateClickedEvent(),
                      );
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateClickedEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                itemBuilder: (context, index) =>
                    ProductWidget(
                      productModel: successState.product[index],
                      homeBloc: homeBloc,
                    ),
              ),
            );
          case HomeErrorState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Error"),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
