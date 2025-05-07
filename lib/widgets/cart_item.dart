import 'package:flutter/material.dart';
import 'package:shopiee/models/product.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              getIconForProduct(product.category),
              color: Colors.grey.shade700,
            ),
          ),
          title: Text(product.name),
          subtitle: Text(
            'Total: \$${(product.price * quantity).toStringAsFixed(2)}',
          ),
          trailing: SizedBox(
            width: 120,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onDecrement,
                ),
                Text('$quantity'),
                IconButton(icon: const Icon(Icons.add), onPressed: onIncrement),
                IconButton(icon: const Icon(Icons.delete), onPressed: onRemove),
              ],
            ),
          ),
        ),
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
