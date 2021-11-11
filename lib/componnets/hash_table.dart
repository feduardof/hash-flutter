import 'package:flutter/material.dart';
import 'package:hash/componnets/hash_table_item.dart';
import 'package:hash/controller/game_controller.dart';

class HashTable extends StatelessWidget {
  final GameController controllerGame;

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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
            HashTableItem(
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
