library cart;

import 'package:project_learning/model/cart_model.dart';
import 'package:project_learning/model/product_model.dart';

List<CartModel> list = [];

void addOrUpdate(ProductModel product, int unit) async {
  bool ok = true;
  for (int i = 0; i < list.length; i++) {
    if (list[i].id == product.id) {
      ok = false;
      list[i].unit += unit;
      if (list[i].unit == 0) {
        list.remove(list[i]);
        break;
      }
    }
  }
  if (ok) {
    list.add(CartModel(
        id: product.id ?? 0,
        category: product.category ?? "",
        price: product.price ?? 0,
        description: product.description ?? "",
        image: product.image ?? "",
        title: product.title ?? "",
        unit: unit));
  }
}

void remove(ProductModel product) async {
  for (int i = 0; i < list.length; i++) {
    if (list[i].id == product.id) {
      list.remove(list[i]);
      break;
    }
  }
}

void removeAll() async {
  list = [];
}

num getTotal() {
  num total = 0;
  for (int i = 0; i < list.length; i++) {
    total = total + list[i].price * list[i].unit;
  }
  return total;
}
