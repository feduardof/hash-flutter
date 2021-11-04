// import 'package:flutter/material.dart';

// class PlacarHashWidget extends StatefulWidget {
//   final int winners;
//   final int losers;
//   final int drawners;

//   const PlacarHashWidget(
//       {Key? key,
//       required this.winners,
//       required this.losers,
//       required this.drawners})
//       : super(key: key);

//   @override
//   _PlacarHashWidgetState createState() => _PlacarHashWidgetState();
// }

// class _PlacarHashWidgetState extends State<PlacarHashWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Center(
//           child: Column(
//             children: [
//               Text(
//                 "Vitórias",
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 18,
//                 ),
//               ),
//               Divider(),
//               Text(
//                 widget.winners.toString(),
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 18,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Spacer(),
//         Center(
//           child: Column(
//             children: [
//               Text(
//                 "Empates",
//                 style: TextStyle(
//                   color: Colors.indigo,
//                   fontSize: 18,
//                 ),
//               ),
//               Divider(),
//               Text(
//                 widget.drawners.toString(),
//                 style: TextStyle(
//                   color: Colors.indigo,
//                   fontSize: 18,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Spacer(),
//         Center(
//           child: Column(
//             children: [
//               Text(
//                 "Derrotas",
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 18,
//                 ),
//               ),
//               Divider(),
//               Text(
//                 widget.losers.toString(),
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 18,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
