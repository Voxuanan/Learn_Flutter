import "dart:core";

class CartModel {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  int unit;
  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.unit,
  });

  factory CartModel.fromJson(Map<String, dynamic> obj) {
    return CartModel(
      id: obj["id"],
      title: obj["title"],
      price: obj["price"].toDouble(),
      description: obj["description"],
      category: obj["category"],
      image: obj["image"],
      unit: obj["unit"],
    );
  }
}
