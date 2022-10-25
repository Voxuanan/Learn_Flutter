import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_learning/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];
  ProductModel item = ProductModel(
      id: 0,
      title: "",
      price: 0,
      description: "",
      category: "",
      image: "",
      rating: Rating(rate: 0, count: 0));

  void getList() async {
    String apiUrl = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var productsListObject = jsonObject as List;
    list = productsListObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    // notifyListeners();
  }

  void getItem(String id) async {
    String apiUrl = "https://fakestoreapi.com/products/$id";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    item = ProductModel.fromJson(jsonObject);
    notifyListeners();
  }

  void searchByCategoryAndName(String title, String category) async {
    if (category == "") {
      getList();
    } else {
      String apiUrl = "https://fakestoreapi.com/products/category/$category";
      var client = http.Client();
      var jsonString = await client.get(Uri.parse(apiUrl));
      var jsonObject = jsonDecode(jsonString.body);
      var productsListObject = jsonObject as List;
      list = productsListObject.map((e) {
        return ProductModel.fromJson(e);
      }).toList();
    }
    if (title != "") {
      list = list
          .where((product) =>
              product.title!.toLowerCase().contains(title.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
