import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsPovider extends ChangeNotifier {
  List<NewsModel> list = [];

  void getList() async {
    String apiUrl =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-09-11&sortBy=publishedAt&apiKey=570ccd1e84d346e78a9036d15c96ffc0";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var newListObject = jsonObject['articles'] as List;
    list = newListObject.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
