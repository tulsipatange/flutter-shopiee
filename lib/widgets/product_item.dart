import 'package:flutter/material.dart';
import 'package:shopiee/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const ProductItem({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.grey.shade200,
              ),
              child: Icon(
                getIconForProduct(product.category),
                size: 64,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onAddToCart(product),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData getIconForProduct(String category) {
    switch (category) {
      case 'Clothing':
        return Icons.checkroom;
      case 'Footwear':
        return Icons.shopping_bag;
      case 'Accessories':
        return Icons.watch;
      case 'Electronics':
        return Icons.devices;
      default:
        return Icons.shopping_basket;
    }
  }
}
