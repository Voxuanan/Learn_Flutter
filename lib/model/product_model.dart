import "dart:core";

class Rating {
  double? rate;
  int? count;
  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> obj) {
    return Rating(
      rate: obj["rate"].toDouble(),
      count: obj["count"],
    );
  }
}

class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> obj) {
    return ProductModel(
      id: obj["id"],
      title: obj["title"],
      price: obj["price"].toDouble(),
      description: obj["description"],
      category: obj["category"],
      image: obj["image"],
      rating: Rating.fromJson(obj["rating"]),
    );
  }
}
