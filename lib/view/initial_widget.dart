import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hash/componnets/button_hash.dart';
import 'package:hash/componnets/scaffold_app.dart';
import 'package:hash/controller/game_controller.dart';
import 'package:hash/main.dart';
import 'package:hash/view/hash_widget.dart';

class InitialWidget extends StatefulWidget {
  const InitialWidget({Key? key}) : super(key: key);

  @override
  _InitialWidgetState createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Game _controllerGame = new Game();

  var showGame = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: buildMenu(),
        ),
      ),
    );
  }

  List<Widget> buildMenu() {
    return [
      Spacer(),
      ButtonHash(
        title: "Start",
        onTap: () {
          Navigator.push(
            context,
            NoAnimationMaterialPageRoute(
              builder: (context) {
                _controllerGame.start(DifficultyLevel.hard);
                return HashWidget(controllerGame: _controllerGame);
              },
            ),
          );
        },
      ),
      ButtonHash(
        title: "Play With Your Friend",
        onTap: () {
          print("Pressed");
        },
        disable: true,
      ),
      ButtonHash(
        title: "Exit",
        onTap: () {
          exit(0);
        },
      ),
      Spacer(),
    ];
  }
}
