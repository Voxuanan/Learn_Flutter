import 'package:flutter/material.dart';
import 'package:project_learning/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newProvider = Provider.of<NewsPovider>(context);
    newProvider.getList();
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...newProvider.list.map((e) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(e.urlToImage ?? ""),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Text(
                        e.title ?? "Hello",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(e.description ?? "Hello"),
                    ],
                  ),
                ),
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
