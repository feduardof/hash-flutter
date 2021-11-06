import 'dart:math';

import 'package:hash/controller/game_controller.dart';
import 'package:hash/model/Player.dart';

class OponnentComputer {
  timeOfOpponentComputerEasy(Positions positions, Function playRound) async {
    await Future.delayed(Duration(milliseconds: 700));
    Position positionFree = positions.shuffleFree();
    playRound(x: positionFree.x, y: positionFree.y);
  }

  timeOfOpponentComputerMedium(Positions positions, Function playRound) async {
    AnalyzerPositions analyzerPositions = AnalyzerPositions(
      positions: positions,
    );
    Position positionFree = analyzerPositions.getNextStepOpositionMedium();
    await Future.delayed(Duration(milliseconds: 500));
    playRound(x: positionFree.x, y: positionFree.y);
  }

  timeOfOpponentComputerHard(Positions positions, Function playRound) async {
    await Future.delayed(Duration(milliseconds: 200));
    AnalyzerPositions analyzerPositions =
        AnalyzerPositions(positions: positions);
    Position positionFree = analyzerPositions.getNextStepOpositionHard();
    playRound(x: positionFree.x, y: positionFree.y);
  }

  Position? analyserPossibleWin(List<Position> positionsFree) {}
}

class AnalyzerPositions {
  Positions positions;

  AnalyzerPositions({required this.positions});

  Player getPlayer(int x, int y) {
    return positions.getPlayer(x: x, y: y);
  }

  bool checkIsPlayer(int x, int y) {
    return getPlayer(x, y).isPlayer();
  }

  bool checkIsOpponent(int x, int y) {
    return getPlayer(x, y).isOpponent();
  }

  bool checkIsEmpty(int x, int y) {
    return getPlayer(x, y).isEmpty();
  }

  Position? getPossiblePosition(
      {required Position p1,
      required Position p2,
      required Position p3,
      required Function check}) {
    int sum = check(p1.x, p1.y) ? 1 : 0;
    sum += check(p2.x, p2.y) ? 3 : 0;
    sum += check(p3.x, p3.y) ? 5 : 0;

    if (sum == 4 && checkIsEmpty(p3.x, p3.y))
      return positions.getPosition(x: p3.x, y: p3.y);
    else if (sum == 6 && checkIsEmpty(p2.x, p2.y))
      return positions.getPosition(x: p2.x, y: p2.y);
    else if (sum == 8 && checkIsEmpty(p1.x, p1.y))
      return positions.getPosition(x: p1.x, y: p1.y);

    return null;
  }

  Position? getPositionToBlockPlayer({
    required Position p1,
    required Position p2,
    required Position p3,
  }) {
    return getPossiblePosition(p1: p1, p2: p2, p3: p3, check: checkIsPlayer);
  }

  Position? getPositionToWin({
    required Position p1,
    required Position p2,
    required Position p3,
  }) {
    return getPossiblePosition(p1: p1, p2: p2, p3: p3, check: checkIsOpponent);
  }

  Position? stepToBlockWinPlayer() {
    Position? block;
    for (var p in positions.positions) {
      if (!p.player.isPlayer()) continue;
      // Checando na linha
      block = getPositionToBlockPlayer(
        p1: positions.getPosition(x: 1, y: p.y),
        p2: positions.getPosition(x: 2, y: p.y),
        p3: positions.getPosition(x: 3, y: p.y),
      );
      if (block != null) return block;

      // Checando na coluna
      block = getPositionToBlockPlayer(
        p1: positions.getPosition(x: p.x, y: 1),
        p2: positions.getPosition(x: p.x, y: 2),
        p3: positions.getPosition(x: p.x, y: 3),
      );
      if (block != null) return block;

      // Checando na diagonal
      if (p.x == p.y || p.x + p.y == 4) {
        block = getPositionToBlockPlayer(
          p1: positions.getPosition(x: 1, y: 1),
          p2: positions.getPosition(x: 2, y: 2),
          p3: positions.getPosition(x: 3, y: 3),
        );
        if (block != null) return block;

        block = getPositionToBlockPlayer(
          p1: positions.getPosition(x: 1, y: 3),
          p2: positions.getPosition(x: 2, y: 2),
          p3: positions.getPosition(x: 3, y: 1),
        );
        if (block != null) return block;
      }
    }
    return null;
  }

  Position? stepToWin() {
    Position? win;

    for (var p in positions.positions) {
      if (!p.player.isOpponent()) continue;
      // Checando na linha
      win = getPositionToWin(
        p1: positions.getPosition(x: 1, y: p.y),
        p2: positions.getPosition(x: 2, y: p.y),
        p3: positions.getPosition(x: 3, y: p.y),
      );
      if (win != null) return win;

      // Checando na coluna
      win = getPositionToWin(
        p1: positions.getPosition(x: p.x, y: 1),
        p2: positions.getPosition(x: p.x, y: 2),
        p3: positions.getPosition(x: p.x, y: 3),
      );
      if (win != null) return win;

      // Checando na diagonal
      if (p.x == p.y || p.x + p.y == 4) {
        win = getPositionToWin(
          p1: positions.getPosition(x: 1, y: 1),
          p2: positions.getPosition(x: 2, y: 2),
          p3: positions.getPosition(x: 3, y: 3),
        );
        if (win != null) return win;

        win = getPositionToWin(
          p1: positions.getPosition(x: 1, y: 3),
          p2: positions.getPosition(x: 2, y: 2),
          p3: positions.getPosition(x: 3, y: 1),
        );
        if (win != null) return win;
      }
    }
    return null;
  }

  Position getNextStepOpositionMedium() {
    Position? blockWinPlayer = stepToBlockWinPlayer();
    if (blockWinPlayer != null) {
      return blockWinPlayer;
    }
    return positions.shuffleFree();
  }

  Position getNextStepOpositionHard() {
    Position? stepWin = stepToWin();
    if (stepWin != null) {
      return stepWin;
    }
    Position? blockWinPlayer = stepToBlockWinPlayer();
    if (blockWinPlayer != null) {
      return blockWinPlayer;
    }
    return positions.shuffleFree();
  }
}
