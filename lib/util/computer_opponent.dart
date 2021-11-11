import 'package:hash/model/position.dart';
import 'package:hash/util/analyzer_positions.dart';

class ComputerOponnent {
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
