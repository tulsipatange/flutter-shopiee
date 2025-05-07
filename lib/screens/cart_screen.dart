import 'package:flutter/material.dart';
import 'package:shopiee/models/cart_item.dart';
import 'package:shopiee/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems =
        ModalRoute.of(context)!.settings.arguments as List<CartItem>;

    double totalAmount = cartItems.fold(
      0,
      (sum, item) => sum + item.totalPrice,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child:
                cartItems.isEmpty
                    ? const Center(
                      child: Text(
                        'Your cart is empty!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder:
                          (ctx, i) => CartItemWidget(
                            product: cartItems[i].product,
                            quantity: cartItems[i].quantity,
                            onIncrement: () {
                              setState(() {
                                cartItems[i].quantity += 1;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                if (cartItems[i].quantity > 1) {
                                  cartItems[i].quantity -= 1;
                                } else {
                                  cartItems.removeAt(i);
                                }
                              });
                            },
                            onRemove: () {
                              setState(() {
                                cartItems.removeAt(i);
                              });
                            },
                          ),
                    ),
          ),
          if (cartItems.isNotEmpty)
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 20)),
                        const Spacer(),
                        Chip(
                          label: Text(
                            '\$${totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Checkout functionality
                          showDialog(
                            context: context,
                            builder:
                                (ctx) => AlertDialog(
                                  title: const Text('Checkout'),
                                  content: const Text(
                                    'Your order has been placed successfully!',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems.clear();
                                        });
                                        Navigator.of(ctx).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
