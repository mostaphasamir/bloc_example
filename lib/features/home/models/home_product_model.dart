class ProductModel {
  final int id;

  final String name;

  final String description;
  final int quantity;

  final double price;
  final String category;

  final String imageURL;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.category,
    required this.imageURL,
  });
}
