import 'package:flutter/material.dart';
import 'package:project_learning/products_page.dart';
import 'package:provider/provider.dart';
import 'provider/category_provider.dart';
import 'provider/product_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (_) => CategoryProvider())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: ProductsPage())));
}
