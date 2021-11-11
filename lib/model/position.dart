import 'package:hash/model/player.dart';

class Position {
  int x;
  int y;
  Player player;

  Position({required this.x, required this.y, required this.player});
}

class Positions {
  List<Position> positions = [];
  Positions() {
    [1, 2, 3].forEach((x) {
      [1, 2, 3].forEach((y) {
        positions.add(Position(x: x, y: y, player: Players.empty));
      });
    });
  }

  bool detectFinish() {
    var allSected = true;
    positions.forEach((position) {
      if (position.player.isEmpty()) allSected = false;
    });

    return allSected;
  }

  bool checkSamePlayer(List<Position> positionsParam) {
    var pl = positionsParam.first.player;
    return positionsParam.every((p) => p.player.equals(pl));
  }

  Player? detectWinner() {
    Player? winner;
    for (var i in [1, 2, 3].toList()) {
      // Todos da mesma coluna são identicos
      if (checkSamePlayer(positions.where((p) => p.y == i).toList())) {
        winner = positions.where((p) => p.y == i).toList().first.player;
      }
      // Todos da mesma linha são identicos
      if (checkSamePlayer(positions.where((p) => p.x == i).toList())) {
        winner = positions.where((p) => p.x == i).toList().first.player;
      }
    }

    // Todos da diagonal esquerda para direita
    if (checkSamePlayer(positions.where((p) => p.x == p.y).toList())) {
      winner = positions.where((p) => p.x == p.y).toList().first.player;
    }
    // Todos da diagonal direita para esquerda
    if (checkSamePlayer(positions.where((p) => p.x + p.y == 4).toList())) {
      winner = positions.where((p) => p.x + p.y == 4).toList().first.player;
    }
    return winner;
  }

  void play({required int x, required int y, required Player player}) {
    positions.firstWhere((p) => (p.x == x) && (p.y == y)).player = player;
  }

  Player getPlayer({required int x, required int y}) {
    return getPosition(x: x, y: y).player;
  }

  Position getPosition({required int x, required int y}) {
    return this.positions.firstWhere((p) => p.x == x && p.y == y);
  }

  Position shuffleFree() {
    List<Position> list = positions.where((p) => p.player.isEmpty()).toList();
    return (list..shuffle()).first;
  }
}
