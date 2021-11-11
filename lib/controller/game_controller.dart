import 'package:flutter/material.dart';
import 'package:hash/model/difficulty_level.dart';
import 'package:hash/model/hash_scorboard.dart';
import 'package:hash/model/player.dart';
import 'package:hash/model/position.dart';
import 'package:hash/model/state_game.dart';
import 'package:hash/util/computer_opponent.dart';
import 'package:rx_notifier/rx_notifier.dart';

class GameController {
  ValueNotifier<StateGame> stateGame = ValueNotifier<StateGame>(StateGame.open);
  Positions positions = Positions();

  ValueNotifier<Positions> positionsNotify = ValueNotifier(Positions());

  var timeOf = Players.empty;
  var actualPlayer = Players.empty;

  DifficultyLevel _level = DifficultyLevel.medium;
  var scoreboard = HashScoreboard();

  // HashScoreboard get scoreboard => scoreboard.value;

  Player winner = Players.empty;

  start(DifficultyLevel level) {
    actualPlayer = Players.player;
    stateGame.value = StateGame.start;
    _level = level;
    positions = Positions();
    positionsNotify.value = this.positions;
  }

  DifficultyLevel getLevel() {
    return _level;
  }

  play({required int x, required int y}) {
    if (stateGame.value != StateGame.start) return;
    if (!positions.getPlayer(x: x, y: y).isEmpty()) return;
    positions.play(
      x: x,
      y: y,
      player: actualPlayer,
    );

    switchActualPlayer();
    detectWinner();
    detectFinish();
    positionsNotify.value = this.positions;
    positionsNotify.notifyListeners();

    if (actualPlayer.isOpponent() && stateGame.value != StateGame.finish) {
      if (_level == DifficultyLevel.easy)
        ComputerOponnent().timeOfOpponentComputerEasy(positions, play);
      else if (_level == DifficultyLevel.medium)
        ComputerOponnent().timeOfOpponentComputerMedium(positions, play);
      else if (_level == DifficultyLevel.hard)
        ComputerOponnent().timeOfOpponentComputerHard(positions, play);
    }
  }

  void switchActualPlayer() {
    actualPlayer = actualPlayer.isOpponent() || actualPlayer.isEmpty()
        ? Players.player
        : Players.opponent;
  }

  setWinner(Player winner) {
    // widget.onWinner(tipoWinner);
    stateGame.value = StateGame.finish;
    scoreboard.addScore(winner);
  }

  detectFinish() {
    if (positions.detectFinish()) {
      stateGame.value = StateGame.finish;
      if (winner.isEmpty()) {
        scoreboard.addScore(winner);
      }
    }
  }

  detectWinner() {
    var winner = positions.detectWinner();
    if (winner != null) {
      setWinner(winner);
    }
  }
}
