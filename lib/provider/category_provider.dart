import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_learning/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> list = [];

  void getList() async {
    String apiUrl = "https://fakestoreapi.com/products/categories";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var categoriesObject = jsonObject as List;
    list = categoriesObject.map((e) {
      return CategoryModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
