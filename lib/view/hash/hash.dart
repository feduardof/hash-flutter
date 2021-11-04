// import 'package:flutter/material.dart';
// import 'package:hash/model/Player.dart';
// import 'package:hash/view/hash/placar_hash.dart';
// import 'package:hash/view/hash/table_hash.dart';

// class HashWidget extends StatefulWidget {
//   const HashWidget({Key? key}) : super(key: key);

//   @override
//   _HashState createState() => _HashState();
// }

// class _HashState extends State<HashWidget> {
//   Player? winner;

//   GlobalKey keyHash = GlobalKey();
//   int drawners = 0;
//   int losers = 0;
//   int winners = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           PlacarHashWidget(
//             drawners: drawners,
//             losers: losers,
//             winners: winners,
//           ),
//           Spacer(
//             flex: 1,
//           ),
//           winner != null
//               ? Text(
//                   winner!.isPlayer()
//                       ? "Você ganhou!"
//                       : winner!.isOpponent()
//                           ? "Você perdeu"
//                           : "Jogo empatado",
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     color: winner!.isPlayer()
//                         ? Colors.green
//                         : winner!.isOpponent()
//                             ? Colors.red
//                             : Colors.blue,
//                   ),
//                 )
//               : Text(""),
//           Spacer(
//             flex: 1,
//           ),
//           winner != null
//               ? ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       winner = null;
//                       keyHash = GlobalKey();
//                     });
//                   },
//                   child: Text("Jogar novamente"),
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Color(0xFFFFFFF)),
//                   ),
//                 )
//               : Text(""),
//           Spacer(
//             flex: 1,
//           ),
//           TableHash(key: keyHash, onWinner: onWinner)
//         ],
//       ),
//     );
//   }

//   onWinner(Player win) {
//     setState(() {
//       winner = win;
//       if (winner!.isPlayer())
//         this.winners++;
//       else if (winner!.isOpponent())
//         this.losers++;
//       else
//         this.drawners++;
//     });
//   }
// }
