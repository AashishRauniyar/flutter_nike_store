import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoestore/components/cart_item.dart';
import 'package:shoestore/models/cart.dart';
import 'package:shoestore/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text("My Cart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

            const SizedBox(height: 20),

            // list of items in cart

            Expanded(
                child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                Shoe individualShoe = value.getUserCart()[index];

                //return cart iem
                return CartItem(shoe: individualShoe);
              },
            ))
          ],
        ),
      ),
    );
  }
}
