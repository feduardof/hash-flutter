import 'dart:math';

import 'package:hash/model/Player.dart';

class OponnentComputer {
  timeOfOpponentComputerEasy(
      List<List<Player>> positions, Function playRound) async {
    List<PositionFree> positionsFree =
        AnalyzerPositions(positions).positionsFree;
    var rnd = Random();
    int playInPosition = rnd.nextInt(positionsFree.length - 1);
    PositionFree positionFree = positionsFree[playInPosition];
    await Future.delayed(Duration(milliseconds: 700));
    playRound(x: positionFree.x, y: positionFree.y);
  }

  timeOfOpponentComputerMedium(
      List<List<Player>> positions, Function playRound) async {
    AnalyzerPositions analyzerPositions = AnalyzerPositions(positions);
    PositionFree positionFree = analyzerPositions.getNextStepOpositionMedium();
    await Future.delayed(Duration(milliseconds: 400));
    playRound(x: positionFree.x, y: positionFree.y);
  }

  timeOfOpponentComputerHard(
      List<List<Player>> positions, Function playRound) async {
    await Future.delayed(Duration(milliseconds: 400));
    AnalyzerPositions analyzerPositions = AnalyzerPositions(positions);
    PositionFree positionFree = analyzerPositions.getNextStepOpositionHard();
    playRound(x: positionFree.x, y: positionFree.y);
  }

  PositionFree? analyserPossibleWin(List<PositionFree> positionsFree) {}
}

class Position {
  int x;
  int y;
  Position(this.x, this.y);
}

class PositionFree extends Position {
  PositionFree(int x, int y) : super(x, y);
}

class PositionOpponent extends Position {
  PositionOpponent(int x, int y) : super(x, y);
}

class PositionPlayer extends Position {
  PositionPlayer(int x, int y) : super(x, y);
}

class AnalyzerPositions {
  List<PositionFree> positionsFree = [];
  List<PositionOpponent> positionsOpponent = [];
  List<PositionPlayer> positionsPlayer = [];
  List<List<Player>> positions = [];

  AnalyzerPositions(this.positions) {
    [0, 1, 2].forEach((x) {
      [0, 1, 2].forEach((y) {
        if (positions[x][y].isEmpty()) {
          positionsFree.add(PositionFree(x, y));
        }
        if (positions[x][y].isPlayer()) {
          positionsPlayer.add(PositionPlayer(x, y));
        }
        if (positions[x][y].isOpponent()) {
          positionsOpponent.add(PositionOpponent(x, y));
        }
      });
    });
  }

  Player getPosition(int x, int y) {
    return positions[x][y];
  }

  bool checkPositionIsPlayer(Position p) {
    return getPosition(p.x, p.y).isPlayer();
  }

  bool checkPositionIsOpponent(Position p) {
    return getPosition(p.x, p.y).isOpponent();
  }

  PositionFree? stepToBlockWinPlayer() {
    for (var p in positionsPlayer) {
      int winInRow = checkPositionIsPlayer(Position(0, p.y)) ? 1 : 0;
      winInRow += checkPositionIsPlayer(Position(1, p.y)) ? 3 : 0;
      winInRow += checkPositionIsPlayer(Position(2, p.y)) ? 5 : 0;

      if (winInRow == 4 && getPosition(2, p.y).isEmpty())
        return PositionFree(2, p.y);
      else if (winInRow == 6 && getPosition(1, p.y).isEmpty())
        return PositionFree(1, p.y);
      else if (winInRow == 8 && getPosition(0, p.y).isEmpty())
        return PositionFree(0, p.y);

      int winInColumn = checkPositionIsPlayer(Position(p.x, 0)) ? 1 : 0;
      winInColumn += checkPositionIsPlayer(Position(p.x, 1)) ? 3 : 0;
      winInColumn += checkPositionIsPlayer(Position(p.x, 2)) ? 5 : 0;

      if (winInColumn == 4 && getPosition(p.x, 2).isEmpty())
        return PositionFree(p.x, 2);
      else if (winInColumn == 6 && getPosition(p.x, 1).isEmpty())
        return PositionFree(p.x, 1);
      else if (winInColumn == 8 && getPosition(p.x, 0).isEmpty())
        return PositionFree(p.x, 0);

      if (p.x == p.y || p.x + p.y == 4) {
        int winInAngleToRight = checkPositionIsPlayer(Position(0, 0)) ? 1 : 0;
        winInAngleToRight += checkPositionIsPlayer(Position(1, 1)) ? 3 : 0;
        winInAngleToRight += checkPositionIsPlayer(Position(2, 2)) ? 5 : 0;

        if (winInAngleToRight == 4 && getPosition(2, 2).isEmpty())
          return PositionFree(2, 2);
        else if (winInAngleToRight == 6 && getPosition(1, 1).isEmpty())
          return PositionFree(1, 1);
        else if (winInAngleToRight == 8 && getPosition(0, 0).isEmpty())
          return PositionFree(0, 0);

        int winInAngleToLeft = checkPositionIsPlayer(Position(0, 2)) ? 1 : 0;
        winInAngleToLeft += checkPositionIsPlayer(Position(1, 1)) ? 3 : 0;
        winInAngleToLeft += checkPositionIsPlayer(Position(2, 0)) ? 5 : 0;

        if (winInAngleToLeft == 4 && getPosition(2, 0).isEmpty())
          return PositionFree(2, 0);
        else if (winInAngleToLeft == 6 && getPosition(1, 1).isEmpty())
          return PositionFree(1, 1);
        else if (winInAngleToLeft == 8 && getPosition(0, 2).isEmpty())
          return PositionFree(0, 2);
      }
    }
    return null;
  }

  PositionFree? stepToWin() {
    for (var p in positionsOpponent) {
      int winInRow = checkPositionIsOpponent(Position(0, p.y)) ? 1 : 0;
      winInRow += checkPositionIsOpponent(Position(1, p.y)) ? 3 : 0;
      winInRow += checkPositionIsOpponent(Position(2, p.y)) ? 5 : 0;

      if (winInRow == 4 && getPosition(2, p.y).isEmpty())
        return PositionFree(2, p.y);
      else if (winInRow == 6 && getPosition(1, p.y).isEmpty())
        return PositionFree(1, p.y);
      else if (winInRow == 8 && getPosition(0, p.y).isEmpty())
        return PositionFree(0, p.y);

      int winInColumn = checkPositionIsOpponent(Position(p.x, 0)) ? 1 : 0;
      winInColumn += checkPositionIsOpponent(Position(p.x, 1)) ? 3 : 0;
      winInColumn += checkPositionIsOpponent(Position(p.x, 2)) ? 5 : 0;

      if (winInColumn == 4 && getPosition(p.x, 2).isEmpty())
        return PositionFree(p.x, 2);
      else if (winInColumn == 6 && getPosition(p.x, 1).isEmpty())
        return PositionFree(p.x, 1);
      else if (winInColumn == 8 && getPosition(p.x, 0).isEmpty())
        return PositionFree(p.x, 0);

      if (p.x == p.y || p.x + p.y == 4) {
        int winInAngleToRight = checkPositionIsOpponent(Position(0, 0)) ? 1 : 0;
        winInAngleToRight += checkPositionIsOpponent(Position(1, 1)) ? 3 : 0;
        winInAngleToRight += checkPositionIsOpponent(Position(2, 2)) ? 5 : 0;

        if (winInAngleToRight == 4 && getPosition(2, 2).isEmpty())
          return PositionFree(2, 2);
        else if (winInAngleToRight == 6 && getPosition(1, 1).isEmpty())
          return PositionFree(1, 1);
        else if (winInAngleToRight == 8 && getPosition(0, 0).isEmpty())
          return PositionFree(0, 0);

        int winInAngleToLeft = checkPositionIsOpponent(Position(0, 2)) ? 1 : 0;
        winInAngleToLeft += checkPositionIsOpponent(Position(1, 1)) ? 3 : 0;
        winInAngleToLeft += checkPositionIsOpponent(Position(2, 0)) ? 5 : 0;

        if (winInAngleToLeft == 4 && getPosition(2, 0).isEmpty())
          return PositionFree(2, 0);
        else if (winInAngleToLeft == 6 && getPosition(1, 1).isEmpty())
          return PositionFree(1, 1);
        else if (winInAngleToLeft == 8 && getPosition(0, 2).isEmpty())
          return PositionFree(0, 2);
      }
    }
    return null;
  }

  PositionFree getNextStepOpositionMedium() {
    PositionFree? blockWinPlayer = stepToBlockWinPlayer();
    if (blockWinPlayer != null) {
      return blockWinPlayer;
    }
    return (positionsFree..shuffle()).first;
  }

  PositionFree getNextStepOpositionHard() {
    PositionFree? stepWin = stepToWin();
    if (stepWin != null) {
      return stepWin;
    }
    PositionFree? blockWinPlayer = stepToBlockWinPlayer();
    if (blockWinPlayer != null) {
      return blockWinPlayer;
    }
    return (positionsFree..shuffle()).first;
  }
}
