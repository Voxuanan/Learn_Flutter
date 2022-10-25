import 'package:flutter/material.dart';

class ImageDestination extends StatelessWidget {
  ImageDestination({Key? key}) : super(key: key);

  final List<String> _list = [
    "assets/images/girls/girl1.jpg",
    "assets/images/girls/girl2.jpg",
    "assets/images/girls/girl3.jpg",
    "assets/images/girls/girl4.jpg",
    "assets/images/girls/girl5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) => Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(e), fit: BoxFit.cover)),
                ))
          ],
        ),
      ),
    );
  }
}
