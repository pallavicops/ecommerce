import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/screens/homeScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: MaterialApp(
        title: 'Ecommerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
