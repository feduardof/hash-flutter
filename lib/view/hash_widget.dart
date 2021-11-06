import 'package:flutter/material.dart';
import 'package:hash/componnets/button_hash.dart';
import 'package:hash/componnets/hash_scoreboard.dart';
import 'package:hash/componnets/scaffold_app.dart';
import 'package:hash/controller/game_controller.dart';
import 'package:hash/main.dart';
import 'package:hash/view/initial_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

// ignore: must_be_immutable
class HashWidget extends StatelessWidget {
  final Game controllerGame;

  const HashWidget({Key? key, required this.controllerGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScaffoldApp(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: hash(context),
        ),
      ),
    );
  }

  List<Widget> hash(BuildContext context) {
    return [
      Row(
        children: [
          Spacer(),
          ButtonHash(
            title: "Back",
            onTap: () {
              // controllerGame.reset();
              Navigator.pushAndRemoveUntil(context,
                  NoAnimationMaterialPageRoute(
                builder: (context) {
                  return InitialWidget();
                },
              ), (route) => false);
            },
          ),
          ButtonHash(
            title: "Restart",
            onTap: () {
              controllerGame.start(controllerGame.getLevel());
            },
          ),
          Spacer(),
        ],
      ),
      Spacer(),
      HashScoreboardWidget(scoreboard: controllerGame.scoreboard),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.width * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: Color(0xFFffffd2),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder(
              valueListenable: controllerGame.stateGame,
              builder: (BuildContext context, StateGame state, Widget? child) {
                var hash = HashTable(
                  controllerGame: controllerGame,
                );
                switch (state) {
                  case StateGame.open:
                    return Text("Finalizado");
                  case StateGame.finish:
                  case StateGame.start:
                    return hash;
                }
              },
            ),
          ),
        ),
      )
    ];
  }

  // buildHashItem(double sizeContainer, {required int x, required int y}) {
  //   return Expanded(
  //     child: GestureDetector(
  //       onTap: () {
  //         print("as" + x.toString() + " - " + y.toString());
  //       },
  //       child: Container(
  //         height: sizeContainer,
  //         width: sizeContainer,
  //         color: Color(0x00000000),
  //       ),
  //     ),
  //   );
  // }
}

class HashTable extends StatelessWidget {
  final Game controllerGame;

  const HashTable({Key? key, required this.controllerGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Color(0xFF0079ff);
    var sizeBar = 7.0;
    var heightCalc =
        ((MediaQuery.of(context).size.width * 1) - (2 * sizeBar) - 16);
    var sizeContainer = heightCalc / 3;

    return Column(
      children: [
        Row(
          children: [
            TableItem(
              size: sizeContainer,
              x: 1,
              y: 1,
              controllerGame: controllerGame,
            ),
            Container(
              height: sizeContainer,
              width: sizeBar,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
            TableItem(
              size: sizeContainer,
              x: 1,
              y: 2,
              controllerGame: controllerGame,
            ),
            Container(
              height: sizeContainer,
              width: sizeBar,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
            TableItem(
              size: sizeContainer,
              x: 1,
              y: 3,
              controllerGame: controllerGame,
            ),
          ],
        ),
        Container(
          width: heightCalc,
          height: sizeBar,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        Row(
          children: [
            TableItem(
              size: sizeContainer,
              x: 2,
              y: 1,
              controllerGame: controllerGame,
            ),
            Container(
              height: sizeContainer,
              width: sizeBar,
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            TableItem(
              size: sizeContainer,
              x: 2,
              y: 2,
              controllerGame: controllerGame,
            ),
            Container(
              height: sizeContainer,
              width: sizeBar,
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            TableItem(
              size: sizeContainer,
              x: 2,
              y: 3,
              controllerGame: controllerGame,
            ),
          ],
        ),
        Container(
          width: heightCalc,
          height: sizeBar,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        Row(
          children: [
            TableItem(
              size: sizeContainer,
              x: 3,
              y: 1,
              controllerGame: controllerGame,
            ),
            Container(
              height: sizeContainer,
              width: sizeBar,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            TableItem(
              size: sizeContainer,
              x: 3,
              y: 2,
              controllerGame: controllerGame,
            ),
            Container(
              height: sizeContainer,
              width: sizeBar,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            TableItem(
              size: sizeContainer,
              x: 3,
              y: 3,
              controllerGame: controllerGame,
            ),
          ],
        )
      ],
    );
  }
}

class TableItem extends StatefulWidget {
  final double size;

  final int x;

  final int y;

  final Game controllerGame;

  const TableItem({
    Key? key,
    required this.size,
    required this.x,
    required this.y,
    required this.controllerGame,
  }) : super(key: key);

  @override
  _TableItemState createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.controllerGame.play(x: widget.x, y: widget.y);
        },
        child: Container(
          height: widget.size,
          width: widget.size,
          color: Color(0x00000000),
          child: ValueListenableBuilder(
            valueListenable: widget.controllerGame.positionsNotify,
            builder: (BuildContext context, Positions value, Widget? child) {
              if (value.getPlayer(x: widget.x, y: widget.y).isEmpty()) {
                return Text("");
              } else {
                return value.getPlayer(x: widget.x, y: widget.y).isPlayer()
                    ? X()
                    : O();
              }
            },
          ),
        ),
      ),
    );
  }
}

class X extends StatelessWidget {
  const X({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      color: Colors.green,
      size: 52.0,
    );
  }
}

class O extends StatelessWidget {
  const O({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.offline_bolt_outlined,
      color: Colors.red,
      size: 52.0,
    );
  }
}
