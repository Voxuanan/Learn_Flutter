import 'package:flutter/material.dart';

class GirlPage extends StatefulWidget {
  const GirlPage({Key? key}) : super(key: key);

  @override
  State<GirlPage> createState() => _GirlPageState();
}

class _GirlPageState extends State<GirlPage> {
  final List<String> _list = [
    "assets/images/girls/girl1.jpg",
    "assets/images/girls/girl2.jpg",
    "assets/images/girls/girl3.jpg",
    "assets/images/girls/girl4.jpg",
  ];
  bool showGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(context),
            const SizedBox(
              height: 10,
            ),
            buildWelcome(context),
            const SizedBox(
              height: 10,
            ),
            buildSearch(context),
            const SizedBox(
              height: 40,
            ),
            buildSavePlace(context),
            if (showGrid) buildGrid(context) else buildList(context),
          ],
        ),
      ),
    ));
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
          onPressed: () {},
          icon: const Icon(Icons.extension),
        ),
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
            style: TextStyle(fontSize: 30),
          )
        ]);
  }

  buildSearch(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  buildSavePlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Saved Places",
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

  buildGrid(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          ..._list.map((e) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover)),
            );
          })
        ],
      ),
    );
  }

  buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ..._list.map((e) {
            return Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:
                      DecorationImage(image: AssetImage(e), fit: BoxFit.cover)),
            );
          })
        ],
      ),
    );
  }
}
