import 'package:flutter/material.dart';

import '../../home/models/home_product_model.dart';

class CartProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const CartProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset.zero,
              spreadRadius: 1,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(productModel.imageURL),
            )),
          ),
          Text(
            productModel.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            productModel.description,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              Text("${productModel.price} E£"),
              const Spacer(),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
