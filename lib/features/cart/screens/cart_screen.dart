import 'package:bloc_example/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cartProduct.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartBloc cartBloc = CartBloc()..add(CartInitialEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {
          },
          listenWhen: (previous, current) => current is ActionState,
          buildWhen: (previous, current) => current is !ActionState,
          builder: (context, state) {
            switch(state.runtimeType)
            {
              case SuccessState :
                final success = state as SuccessState ;
                return ListView.builder(
                  itemCount: success.cartList.length,
                  itemBuilder: (context, index) =>
                      CartProductWidget(
                        productModel: success.cartList[index],
                      ),
                );
              default :
                return Container();
            }
          },
        )
    );
  }
}
