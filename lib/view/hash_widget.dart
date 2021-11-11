import 'package:flutter/material.dart';
import 'package:hash/componnets/button_hash.dart';
import 'package:hash/componnets/hash_scoreboard.dart';
import 'package:hash/componnets/hash_table.dart';
import 'package:hash/componnets/scaffold_app.dart';
import 'package:hash/controller/game_controller.dart';
import 'package:hash/main.dart';
import 'package:hash/model/state_game.dart';
import 'package:hash/view/initial_widget.dart';

// ignore: must_be_immutable
class HashWidget extends StatelessWidget {
  final GameController controllerGame;

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
}
