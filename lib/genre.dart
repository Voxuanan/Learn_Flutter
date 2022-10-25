import 'package:flutter/material.dart';

class GenreSlider extends StatefulWidget {
  const GenreSlider({Key? key}) : super(key: key);

  @override
  State<GenreSlider> createState() => _GenreSliderState();
}

class _GenreSliderState extends State<GenreSlider> {
  final _list = [
    "All",
    "Action",
    "Adventure",
    "Crime and mystery",
    "Fantasy",
    "Historical",
    "Cyberpunk and derivatives",
    "Romance"
  ];
  String genreSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(5),
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ..._list.map(
                (e) => InkWell(
                  onTap: () {
                    setState(() {
                      genreSelected = e;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: genreSelected == e ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(e),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
