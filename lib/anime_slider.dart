import 'package:flutter/material.dart';
import 'package:project_learning/model/anime_model.dart';

class AnimeSlider extends StatefulWidget {
  const AnimeSlider({Key? key}) : super(key: key);

  @override
  State<AnimeSlider> createState() => _AnimeSliderState();
}

class _AnimeSliderState extends State<AnimeSlider> {
  final List<AnimeModel> _list = AnimeModel.mockData();
  String animeSelected = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/InternetError.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ..._list.map((e) => Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(e.image),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            e.name,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(e.genre.toString(),
                              style: const TextStyle(color: Colors.white)),
                          Row(
                            children: [
                              Text(e.rating.toString(),
                                  style: const TextStyle(color: Colors.white)),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
