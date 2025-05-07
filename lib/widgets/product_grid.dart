import 'package:flutter/material.dart';
import 'package:shopiee/models/product.dart';
import 'package:shopiee/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder:
          (ctx, i) =>
              ProductItem(product: products[i], onAddToCart: onAddToCart),
    );
  }
}
