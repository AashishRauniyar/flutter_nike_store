import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: GNav(
            color: Colors.grey[400],
            activeColor: Colors.grey[800],
            tabActiveBorder: Border.all(
              color: Colors.white,
            ),
            tabBackgroundColor: Colors.grey.shade100,
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 16,
            tabs: const [
              GButton(icon: Icons.home, text: 'Shop'),
              GButton(icon: Icons.shopping_cart, text: 'Cart'),
            ]));
  }
}
