import 'package:flutter/material.dart';
import 'package:shopiee/models/cart_item.dart';
import 'package:shopiee/models/demo_products.dart';
import 'package:shopiee/models/product.dart';
import 'package:shopiee/widgets/product_grid.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<CartItem> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      final existingItemIndex = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingItemIndex >= 0) {
        _cartItems[existingItemIndex].quantity += 1;
      } else {
        _cartItems.add(CartItem(product: product, quantity: 1));
      }
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Item added to cart!"),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "View Cart",
          onPressed: () {
            Navigator.of(context).pushNamed("/cart", arguments: _cartItems);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var allProducts = DemoProducts.getAllProducts;
    final categories =
        allProducts.map((product) => product.category).toSet().toList();

    return DefaultTabController(
      length: categories.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Shopiee!"),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/cart",
                      arguments: _cartItems,
                    );
                  },
                ),
                if (_cartItems.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${_cartItems.fold(0, (sum, item) => sum + item.quantity)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              const Tab(text: "All"),
              ...categories.map((category) => Tab(text: category)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductGrid(products: allProducts, onAddToCart: _addToCart),
            // Category specific products
            ...categories.map((category) => ProductGrid(
              products: allProducts.where((product) => product.category == category).toList(),
              onAddToCart: _addToCart))
          ],
        ),
      ),
    );
  }
}
