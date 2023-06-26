import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/widgets/cartProduct.dart';
import '../bloc/wishlist_bloc.dart';

class WishListScreen extends StatelessWidget {
   WishListScreen({Key? key}) : super(key: key);
  final WishlistBloc wishListBloc = WishlistBloc()..add(WishListInitialEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishListBloc,
        listener: (context, state) {
        },
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is !WishListActionState,
        builder: (context, state) {
          switch(state.runtimeType){
            case WishListSuccessState :
              final successState = state as WishListSuccessState ;
              return ListView.builder(
                itemCount: successState.wishListItems.length,
                itemBuilder: (context, index) =>
                    CartProductWidget(
                      productModel: successState.wishListItems[index],
                    ),
              );
            default :
              return Container();
          }
        },
      ),
    );
  }
}
