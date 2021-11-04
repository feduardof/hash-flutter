// import 'package:flutter/material.dart';
// import 'package:hash/model/Player.dart';
// import 'package:hash/util/OpponentComputer.dart';
// import 'package:hash/view/hash/item_table_hash.dart';

// class TableHash extends StatefulWidget {
//   final Function onWinner;

//   const TableHash({Key? key, required this.onWinner}) : super(key: key);

//   @override
//   _TableHashState createState() => _TableHashState();
// }

// class _TableHashState extends State<TableHash> {
//   var positions = List.generate(
//       3, (index) => List<Player>.generate(3, (index) => Players.empty));

//   Player actualPlayer = Players.player;
//   bool finish = false;
//   var fields = List<Widget>.empty();

//   @override
//   void initState() {
//     super.initState();
//     reloadFields();
//   }

//   reloadFields() {
//     fields = List.generate(
//       3,
//       (x) => Row(
//         children: List.generate(
//           3,
//           (y) => ItemTableWidget(
//             x: x,
//             y: y,
//             onTap: onTapItem,
//             item: positions[x][y].getItemTableHash(),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: fields),
//     );
//   }

//   onTapItem({x: int, y: int}) {
//     if (finish) return;
//     if (!actualPlayer.isPlayer()) return;
//     playRound(x: x, y: y);
//   }

//   playRound({x: int, y: int}) {
//     setState(() {
//       positions[x][y] = actualPlayer;

//       actualPlayer =
//           actualPlayer.isPlayer() ? Players.opponent : Players.player;
//       reloadFields();
//     });
//     detectWinner();
//     detectFinish();

//     if (actualPlayer.isOpponent() && !finish) {
//       // OponnentComputer().timeOfOpponentComputerEasy(positions, playRound);
//       // OponnentComputer().timeOfOpponentComputerMedium(positions, playRound);
//       OponnentComputer().timeOfOpponentComputerHard(positions, playRound);
//     }
//   }

//   setWinner(Player tipoWinner) {
//     widget.onWinner(tipoWinner);
//     setState(() {
//       finish = true;
//     });
//   }

//   detectFinish() {
//     var allSected = true;
//     [0, 1, 2].forEach((x) {
//       [0, 1, 2].forEach((y) {
//         if (positions[x][y].isEmpty()) {
//           allSected = false;
//         }
//       });
//     });

//     if (allSected && !finish) {
//       setWinner(Players.empty);
//     }
//   }

//   detectWinner() {
//     [0, 1, 2].forEach((i) {
//       // Todos da mesma coluna são identicos
//       if (positions[0][i].equals(positions[1][i], positions[2][i])) {
//         setWinner(positions[0][i]);
//         return;
//       }

//       // Todos da mesma linha são identicos
//       if (positions[i][0].equals(positions[i][1], positions[i][2])) {
//         setWinner(positions[i][0]);
//         return;
//       }
//     });

//     if (positions[0][0].equals(positions[1][1], positions[2][2])) {
//       setWinner(positions[0][0]);
//       return;
//     }

//     if (positions[0][2].equals(positions[1][1], positions[2][0])) {
//       setWinner(positions[0][2]);
//       return;
//     }
//   }
// }
