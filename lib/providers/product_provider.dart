import 'package:ecommerce/services/database_service.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import 'package:flutter/material.dart';

import '../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  // Private list of products
  List<ProductModel> _products = [];
  bool isLoading = false;
  // Getter for the list of products
  List<ProductModel> get products => _products;

  // Getter for the list of favorite products
  List<ProductModel> get favourites =>
      _products.where((product) => product.isFavourite).toList();

  // Singleton instance of DatabaseService
  final DatabaseService databaseService = DatabaseService.instance;

  // Method to fetch products from the local database, or from the API if the database is empty
  Future<void> fetchProducts() async {
    isLoading = true;
    await databaseService.deleteAllProducts();
    _products = await databaseService.getProducts();

    // If no products found in the database, fetch from API

    if (_products.isEmpty) {
      final fetchedProducts = await ProductService().fetchProducts();

      // // Insert each fetched product into the local database
      for (var product in fetchedProducts) {
        await databaseService.insertProduct(product);
      }

      // fetch the updated list of products from database

      _products = await databaseService.getProducts();
    }

    isLoading = false;

    // Notify listeners to update the UI
    notifyListeners();
  }

  // Method to toggle the favourite status of a product
  void changeFavourite(int id) {
    final index = _products.indexWhere((product) => product.id == id);

    if (index != -1) {
      // Create a copy of the product with updated isFavourite status
      final updatedProduct = _products[index].copyWith(
        isFavourite: !_products[index].isFavourite,
      );

      // Update the product in the _products list
      _products[index] = updatedProduct;

      // Notify listeners to refresh the UI
      notifyListeners();
    }
  }
}
