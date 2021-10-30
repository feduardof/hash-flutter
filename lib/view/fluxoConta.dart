// import 'dart:math';

// import 'package:flutter/material.dart';

// class HashWidget extends StatefulWidget {
//   HashWidget({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => HashWidgetState();
// }

// class HashWidgetState extends State<HashWidget> {
//   int time = 0;
//   Player actualPlayer = Players.player;
//   var positions = List.generate(3, (index) => List.generate(3, (index) => ""));
//   var positions2 =
//       List.generate(3, (x) => List.generate(3, (y) => FieldWidget(x: x, y: y)));
//   Player? winner;
//   bool isWinner = false;
//   bool isMyTime = true;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Spacer(
//             flex: 1,
//           ),
//           Text(
//             winner != null
//                 ? isWinner
//                     ? "Você ganhou!"
//                     : "Você perdeu"
//                 : "",
//             style: TextStyle(
//               fontSize: 24.0,
//               color: isWinner ? Colors.green : Colors.red,
//             ),
//           ),
//           Spacer(
//             flex: 1,
//           ),
//           winner != null
//               ? ElevatedButton(onPressed: () {}, child: Text("Jogar novamente"))
//               : Text(""),
//           Spacer(
//             flex: 1,
//           ),
//           Column(
//             children: [
//               Row(
//                 children: [
//                   FieldWidget(
//                     x: 1,
//                     y: 1,
//                     hash: this,
//                   ),
//                   FieldWidget(
//                     x: 1,
//                     y: 2,
//                     hash: this,
//                   ),
//                   FieldWidget(
//                     x: 1,
//                     y: 3,
//                     hash: this,
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   FieldWidget(
//                     x: 2,
//                     y: 1,
//                     hash: this,
//                   ),
//                   FieldWidget(
//                     x: 2,
//                     y: 2,
//                     hash: this,
//                   ),
//                   FieldWidget(
//                     x: 2,
//                     y: 3,
//                     hash: this,
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   FieldWidget(
//                     x: 3,
//                     y: 1,
//                     hash: this,
//                   ),
//                   FieldWidget(
//                     x: 3,
//                     y: 2,
//                     hash: this,
//                   ),
//                   FieldWidget(
//                     x: 3,
//                     y: 3,
//                     hash: this,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   bool clicked({x: int, y: int}) {
//     if (winner != null) return false;
//     setState(() {
//       positions[x - 1][y - 1] = actualPlayer.isPlayer() ? "O" : "X";

//       this.time++;
//       actualPlayer =
//           actualPlayer.isPlayer() ? Players.opponent : Players.player;
//     });

//     detectWin();
//     return true;
//   }

//   setWinner(String tipoWinner) {
//     setState(() {
//       winner = tipoWinner == "O" ? Players.player : Players.opponent;
//       isWinner = winner!.isPlayer();
//       print("Temos um ganhador!!");
//     });
//   }

//   bool detectWin() {
//     bool hasWinner = false;
//     positions.forEach((x) {
//       // Todos da mesma linha são identicos
//       if (x[0] == x[1] && x[0] == x[2] && x[0] != "") {
//         hasWinner = true;
//         setWinner(x[0]);
//       }
//     });
//     [0, 1, 2].forEach((y) {
//       // Todos da mesma coluna são identicos
//       if (positions[0][y] == positions[1][y] &&
//           positions[0][y] == positions[2][y] &&
//           positions[0][y] != "") {
//         hasWinner = true;
//         setWinner(positions[0][y]);
//       }
//     });

//     if (positions[0][0] == positions[1][1] &&
//         positions[0][0] == positions[2][2] &&
//         positions[0][0] != "") {
//       hasWinner = true;
//       setWinner(positions[0][0]);
//     }

//     if (positions[0][2] == positions[1][1] &&
//         positions[0][2] == positions[2][0] &&
//         positions[0][2] != "") {
//       hasWinner = true;
//       setWinner(positions[0][2]);
//     }

//     return hasWinner;
//   }

//   timeOfOpponentComputerEasy() {
//     int x = 0;
//     int y = 0;
//     do {
//       var rnd = Random();
//       x = rnd.nextInt(2);
//       y = rnd.nextInt(2);
//     } while (positions[x][y] != "");
//   }
// }


// class FieldWidget extends StatefulWidget {
//   final int x;
//   final int y;
//   final HashWidgetState hash;

//   const FieldWidget(
//       {Key? key, required this.x, required this.y, required this.hash})
//       : super(key: key);

//   @override
//   FieldWidgetState createState() => FieldWidgetState(this.x, this.y, this.hash);
// }

// class FieldWidgetState extends State<FieldWidget> {
//   final int x;
//   final int y;
//   final HashWidgetState hash;

//   FieldWidgetState(this.x, this.y, this.hash);

//   IconData? iconSelected;
//   Color color = Colors.red;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: this.x < 3 ? BorderSide(width: 1.0) : BorderSide.none,
//               right: this.y < 3 ? BorderSide(width: 1.0) : BorderSide.none,
//             ),
//           ),
//           height: 100.0,
//           child: iconSelected != null
//               ? Icon(
//                   iconSelected,
//                   color: color,
//                 )
//               : null,
//         ),
//       ),
//     );
//   }

//   onTap() {
//     if (iconSelected != null) return;
//     if (!hash.isMyTime) return;
//     if (hash.clicked(x: x, y: y)) setIcon();
//   }

//   setIcon() {
//     setState(() {
//       iconSelected = hash.time.isEven ? Icons.check : Icons.bolt_outlined;
//       color = hash.time.isEven ? Colors.red : Colors.green;
//     });
//   }
// }
