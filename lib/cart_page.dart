import 'package:flutter/material.dart';
import 'package:project_learning/model/product_model.dart';
import 'data/cart.dart' as cart;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  buildTitle(context),
                  const SizedBox(
                    height: 10,
                  ),
                  (cart.list.isEmpty)
                      ? const Center(
                          child: Text(
                          "Card is empty",
                          style: TextStyle(fontSize: 50),
                        ))
                      : const SizedBox(),
                  ...cart.list.map((e) {
                    return Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black),
                                    image: DecorationImage(
                                        image: NetworkImage(e.image),
                                        fit: BoxFit.contain)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              e.price.toString(),
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            const Icon(
                                              Icons.monetization_on_outlined,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  child: const Icon(Icons.arrow_circle_left),
                                  onTap: () {
                                    cart.addOrUpdate(
                                        ProductModel(
                                          id: e.id,
                                          category: e.category,
                                          description: e.description,
                                          image: e.image,
                                          price: e.price,
                                          rating: null,
                                          title: e.title,
                                        ),
                                        -1);
                                    setState(() {});
                                  }),
                              const SizedBox(width: 10),
                              Text(
                                e.unit.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                  child: const Icon(Icons.arrow_circle_right),
                                  onTap: () {
                                    cart.addOrUpdate(
                                        ProductModel(
                                          id: e.id,
                                          category: e.category,
                                          description: e.description,
                                          image: e.image,
                                          price: e.price,
                                          rating: null,
                                          title: e.title,
                                        ),
                                        1);
                                    setState(() {});
                                  }),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(
                                    (e.price * e.unit).toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Icon(Icons.monetization_on_outlined)
                                ],
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                  child: const Icon(
                                    Icons.delete_sharp,
                                    color: Colors.red,
                                  ),
                                  onTap: () {
                                    cart.remove(ProductModel(
                                      id: e.id,
                                      category: e.category,
                                      description: e.description,
                                      image: e.image,
                                      price: e.price,
                                      rating: null,
                                      title: e.title,
                                    ));
                                    setState(() {});
                                  }),
                            ],
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 10, right: 20, left: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Remove all",
                          style: TextStyle(color: Colors.white),
                        )),
                    onTap: () {
                      cart.removeAll();
                      setState(() {});
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            cart.getTotal().toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Icon(Icons.monetization_on_outlined)
                        ],
                      ),
                      const SizedBox(width: 20),
                      Container(
                          padding: const EdgeInsets.only(
                              bottom: 10, top: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Payment",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
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
