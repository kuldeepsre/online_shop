// Category model
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name']);
  }
}
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  int quantity; // Quantity can be adjusted when adding to cart
  final int categoryId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 0,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      categoryId: json['categoryId'],
    );
  }
}
