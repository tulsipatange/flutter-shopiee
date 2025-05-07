import 'package:shopiee/models/product.dart';

class DemoProducts {
  static final List<Product> getAllProducts = [
    Product(
      id: 1,
      name: 'T-Shirt',
      price: 19.99,
      category: 'Clothing',
      description: 'A comfortable cotton t-shirt for everyday wear.',
    ),
    Product(
      id: 2,
      name: 'Jeans',
      price: 49.99,
      category: 'Clothing',
      description: 'Classic blue jeans with a modern fit.',
    ),
    Product(
      id: 3,
      name: 'Sneakers',
      price: 79.99,
      category: 'Footwear',
      description: 'Stylish and comfortable sneakers for any occasion.',
    ),
    Product(
      id: 4,
      name: 'Watch',
      price: 129.99,
      category: 'Accessories',
      description:
          'An elegant wristwatch that combines style and functionality.',
    ),
    Product(
      id: 5,
      name: 'Backpack',
      price: 59.99,
      category: 'Accessories',
      description: 'A durable and spacious backpack for everyday use.',
    ),
    Product(
      id: 6,
      name: 'Headphones',
      price: 149.99,
      category: 'Electronics',
      description: 'High-quality wireless headphones with noise cancellation.',
    ),
    Product(
      id: 7,
      name: 'Smartphone',
      price: 699.99,
      category: 'Electronics',
      description: 'A cutting-edge smartphone with advanced features.',
    ),
    Product(
      id: 8,
      name: 'Sunglasses',
      price: 89.99,
      category: 'Accessories',
      description: 'Stylish sunglasses with UV protection.',
    ),
  ];
}
