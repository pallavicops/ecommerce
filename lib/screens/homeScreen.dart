import 'package:ecommerce/screens/productDetailScreen.dart';
import 'package:ecommerce/screens/productsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';
import 'exploreScreen.dart';
import 'favouritesScreen.dart';
import 'ordersScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List pages = [
    const ProductsScreen(),
    const ExploreScreen(),
    const FavouritesScreen(),
    const OrdersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages[selectedIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              // Added to round both corners
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.checkroom,
                ),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: "Favourites",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.inventory_2_outlined,
                ),
                label: "Orders",
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
