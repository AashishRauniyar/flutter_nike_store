import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoestore/components/shoe_tile.dart';
import 'package:shoestore/models/cart.dart';
import 'package:shoestore/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // adding show to cart method
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);
    // alert the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Shoe added to cart"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 235),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search for shoes",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          //message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Everyone flies with Nike, be a part of the family",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          //hot pics

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Deals",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // List of shoes for sale
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // get a shoe from shop list
              Shoe shoe = value.getShoeList()[index];

              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe),
              );
            },
          )),

          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
