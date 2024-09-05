import 'package:flutter/material.dart';
import 'package:shoestore/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "zoom freak",
        price: "257",
        imagePath: "lib/images/1.png",
        description: "awesome shoes made only for basketball players"),
    Shoe(
        name: "Air Jordan",
        price: "240",
        imagePath: "lib/images/2.png",  
        description: "cool and comfortable shoe"),
    Shoe(
        name: "Air Max",
        price: "200",
        imagePath: "lib/images/3.jpg",
        description: "cool and comfortable shoe"),
    Shoe(
        name: "Air Force",
        price: "180",
        imagePath: "lib/images/4.png",
        description: "cool and comfortable shoe"),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
