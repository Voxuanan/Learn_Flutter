import "dart:core";

class CategoryModel {
  String? name;
  CategoryModel({this.name});

  factory CategoryModel.fromJson(String obj) {
    return CategoryModel(name: obj);
  }
}
