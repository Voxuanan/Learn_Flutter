// import 'package:flutter/material.dart';

// class FoodPage extends StatefulWidget {
//   const FoodPage({Key? key}) : super(key: key);

//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }

// class _FoodPageState extends State<FoodPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buidTitle(context),
//               const Text("Find out"),
//               buildBanner(context),
//               buildList(context)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   buidTitle(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           "Today's Specical",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//         Container(
//           padding:
//               const EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
//           decoration: BoxDecoration(
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: const [
//               Icon(Icons.star, color: Colors.white),
//               Text(
//                 "BUY",
//                 style: TextStyle(color: Colors.white),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   buildBanner(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 260,
//           height: 400,
//           child: RaisedButton(
//               onPressed: () {},
//               color: Colors.blue[200],
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(30))),
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 150,
//                       width: 220,
//                       margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                         image: AssetImage("assets/images/foods/sushi1.png"),
//                         fit: BoxFit.cover,
//                       )),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(children: const [
//                             Text("Yoshimasa Sushi",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold)),
//                           ]),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: const [
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.white,
//                                 size: 15,
//                               ),
//                               Text(
//                                 "   250 Ratings",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           const Text(
//                               "Lorem Ipsum is simply dummy text of the printing ",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               )),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               )),
//         ),
//         Column(
//           children: [
//             SizedBox(
//               width: 260,
//               height: 200,
//               child: RaisedButton(
//                   onPressed: () {},
//                   color: Colors.blue[200],
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30))),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 75,
//                           width: 220,
//                           margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                             image: AssetImage("assets/images/foods/salad1.png"),
//                             fit: BoxFit.cover,
//                           )),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(children: const [
//                                 Text("Yoshimasa Sushi",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold)),
//                               ]),
//                               const SizedBox(height: 10),
//                               Row(
//                                 children: const [
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Text(
//                                     "   250 Ratings",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//             ),
//             SizedBox(
//               width: 260,
//               height: 200,
//               child: RaisedButton(
//                   onPressed: () {},
//                   color: Colors.blue[200],
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30))),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 75,
//                           width: 220,
//                           margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                             image: AssetImage("assets/images/foods/sushi2.png"),
//                             fit: BoxFit.cover,
//                           )),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(children: const [
//                                 Text("Prato Sushi",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold)),
//                               ]),
//                               const SizedBox(height: 10),
//                               Row(
//                                 children: const [
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.white,
//                                     size: 15,
//                                   ),
//                                   Text(
//                                     "   250 Ratings",
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )),
//             )
//           ],
//         )
//       ],
//     );
//   }

//   buildList(BuildContext context) {
//     return Expanded(
//       child: ListView(
//         scrollDirection: Axis.vertical,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset("assets/images/foods/location1.png"),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("cc"),
//                         Row(
//                           children: const [
//                             Icon(
//                               Icons.star,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.yellow,
//                             )
//                           ],
//                         ),
//                         const Text("lorem"),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Container(
//                     padding: const EdgeInsets.only(
//                         bottom: 10, top: 10, right: 20, left: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Text(
//                       "Order Now",
//                       style: TextStyle(color: Colors.white),
//                     ))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
