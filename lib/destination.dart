import 'package:flutter/material.dart';
import 'package:project_learning/genre.dart';

import 'image_destination.dart';

//Bài giải
class DestinationPage extends StatelessWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        ImageDestination(),
        const GenreSlider(),
        // blockImage(),
        blockTitle(),
        blogActionButtons(),
        blogBody()
      ]),
    ));
  }

  blockImage() {
    return Image.asset("assets/images/girls/girl1.jpg");
  }

  blockTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Text("Hue University of Sciences",
              style: TextStyle(fontSize: 20, color: Colors.indigoAccent)),
          Text("77 Nguyen Hue Street, Hue City")
        ]),
        Row(children: const [Icon(Icons.star, color: Colors.red), Text("41")])
      ]),
    );
  }

  blogActionButtons() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: const [
            Icon(Icons.phone, color: Colors.blue),
            Text("CALL", style: TextStyle(color: Colors.blue))
          ]),
          Column(children: const [
            Icon(Icons.send, color: Colors.blue),
            Text("ROUTE", style: TextStyle(color: Colors.blue))
          ]),
          Column(children: const [
            Icon(Icons.share, color: Colors.blue),
            Text("SHARE", style: TextStyle(color: Colors.blue))
          ])
        ],
      ),
    );
  }

  blogBody() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    );
  }
}

// Bài 1
// class DestinationPage extends StatelessWidget {
//   const DestinationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Image.asset("assets/images/girls/girl1.jpg"),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text("Anh An đẹp trai vô địch vũ trụ",
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text("Yy <3",
//                         style: TextStyle(
//                             color: Colors.grey, fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//                 Row(children: const [
//                   Icon(Icons.star, color: Colors.red),
//                   Text("41"),
//                 ])
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(children: const [
//                   Icon(Icons.phone, color: Colors.blue),
//                   Text("CALL", style: TextStyle(color: Colors.blue))
//                 ]),
//                 Column(children: const [
//                   Icon(Icons.send, color: Colors.blue),
//                   Text("ROUTE", style: TextStyle(color: Colors.blue))
//                 ]),
//                 Column(children: const [
//                   Icon(Icons.share, color: Colors.blue),
//                   Text("SHARE", style: TextStyle(color: Colors.blue))
//                 ])
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(15.0),
//             child: const Text(
//                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
//           )
//         ],
//       ),
//     ));
//   }
// }
