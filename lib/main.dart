import 'package:flutter/material.dart';
import 'package:shopiee/screens/cart_screen.dart';
import 'package:shopiee/screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopiee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProductListScreen(),
      routes: {
        '/cart': (ctx) => const CartScreen(),
      },
    );
  }
}