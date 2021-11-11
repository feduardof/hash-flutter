import 'package:flutter/material.dart';
import 'package:hash/controller/game_controller.dart';
import 'package:hash/model/position.dart';

class HashTableItem extends StatefulWidget {
  final double size;

  final int x;

  final int y;

  final GameController controllerGame;

  const HashTableItem({
    Key? key,
    required this.size,
    required this.x,
    required this.y,
    required this.controllerGame,
  }) : super(key: key);

  @override
  _HashTableItemState createState() => _HashTableItemState();
}

class _HashTableItemState extends State<HashTableItem> {
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
