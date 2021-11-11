import 'package:hash/model/player.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HashScoreboard {
  var playerScore = RxNotifier<int>(0);
  var opponentScore = RxNotifier<int>(0);
  var drawnsScore = RxNotifier<int>(0);

  addScore(Player player) {
    if (player.isPlayer())
      playerScore.value++;
    else if (player.isOpponent())
      opponentScore.value++;
    else
      drawnsScore.value++;
  }

  @override
  String toString() {
    return "player: " +
        playerScore.toString() +
        "opponent: " +
        opponentScore.toString() +
        "drawn: " +
        drawnsScore.toString();
  }
}
