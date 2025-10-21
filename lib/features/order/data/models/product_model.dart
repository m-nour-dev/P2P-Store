class ProductModel {
  final String name;
  final int quantity;
  final String imageUrl;
  final List<String> variations;
  final double rating;
  final double price;
  final double oldPrice;
  final double discount;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.variations,
    required this.rating,
    required this.price,
    required this.quantity,
    required this.oldPrice,
    required this.discount,
  });
}
