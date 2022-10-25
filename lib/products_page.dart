import 'package:project_learning/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'product_page.dart';
import 'provider/category_provider.dart';
import 'data/cart.dart' as cart;

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool showGrid = true;
  String categorySearch = "";
  String titleSearch = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.searchByCategoryAndName(titleSearch, categorySearch);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getList();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Products"),
            actions: [buildTitle(context)],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildWelcome(context),
                  const SizedBox(
                    height: 10,
                  ),
                  buildSearch(context, categoryProvider),
                  const SizedBox(
                    height: 40,
                  ),
                  buildOurProducts(context),
                  if (showGrid)
                    buildGrid(context, productProvider)
                  else
                    buildList(context, productProvider),
                ],
              ),
            ),
          )),
    );
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

  buildWelcome(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Welcome,",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Text(
            "Yy",
            style: TextStyle(fontSize: 21),
          )
        ]);
  }

  buildSearch(BuildContext context, CategoryProvider categoryProvider) {
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            titleSearch = text;
            setState(() {});
          },
          decoration: const InputDecoration(
            hintText: "Search title",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        categorySearch = "";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color:
                              categorySearch == "" ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("all"),
                    ),
                  ),
                  ...categoryProvider.list.map(
                    (e) => InkWell(
                      onTap: () {
                        setState(() {
                          categorySearch = e.name ?? "";
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: categorySearch == e.name
                                ? Colors.green
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(e.name ?? ""),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  buildOurProducts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Our products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showGrid = true;
                  });
                },
                icon: const Icon(Icons.grid_view_sharp)),
            IconButton(
                onPressed: () {
                  setState(() {
                    showGrid = false;
                  });
                },
                icon: const Icon(Icons.list_alt_rounded))
          ],
        )
      ],
    );
  }

  buildGrid(BuildContext context, ProductProvider productProvider) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1 / 1.15,
        children: [
          ...productProvider.list.map((e) {
            return Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: NetworkImage(e.image ?? ""),
                            fit: BoxFit.contain)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        id: e.id.toString(),
                                      )),
                            );
                          },
                          child: Text(
                            e.title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  e.price.toString(),
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
                                  "${e.rating?.count} product left",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  e.rating?.rate.toString() ?? "",
                                  style: const TextStyle(fontSize: 16),
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
                      e.description ?? "",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        cart.addOrUpdate(e, 1);
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
            );
          })
        ],
      ),
    );
  }

  buildList(BuildContext context, ProductProvider productProvider) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...productProvider.list.map((e) {
            return Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: NetworkImage(e.image ?? ""),
                            fit: BoxFit.contain)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        id: e.id.toString(),
                                      )),
                            );
                          },
                          child: Text(
                            e.title ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  e.price.toString(),
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
                                  "${e.rating?.count} product left",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  e.rating?.rate.toString() ?? "",
                                  style: const TextStyle(fontSize: 16),
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
                      e.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        cart.addOrUpdate(e, 1);
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
            );
          })
        ],
      ),
    );
  }
}
