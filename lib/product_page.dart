import 'package:flutter/material.dart';
import 'package:project_learning/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'data/cart.dart' as cart;

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getItem(id);

    return Scaffold(
      appBar: AppBar(title: Text(productProvider.item.title ?? "Product")),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 50, top: 10, left: 10, right: 10),
          child: Column(
            children: [
              buildTitle(context),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: 500,
                    margin: const EdgeInsets.only(bottom: 10, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image:
                                NetworkImage(productProvider.item.image ?? ""),
                            fit: BoxFit.contain)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Text(
                          productProvider.item.title ?? "",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  productProvider.item.price.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${productProvider.item.rating?.count} product left",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  productProvider.item.rating?.rate
                                          .toString() ??
                                      "",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      productProvider.item.description ?? "",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        cart.addOrUpdate(productProvider.item, 1);
                      },
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              bottom: 10, top: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Order Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildTitle(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        icon: const Icon(Icons.shopping_cart),
      ),
      Text("(${cart.list.length.toString()})")
    ],
  );
}
