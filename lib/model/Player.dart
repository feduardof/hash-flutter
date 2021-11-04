import 'package:hash/model/ItemTableHash.dart';

class Player {
  bool _opponent = false;
  bool _player = false;

  Player(int type) {
    this._player = type == 0;
    this._opponent = type == 1;
  }

  bool isPlayer() {
    return this._player;
  }

  bool isOpponent() {
    return this._opponent;
  }

  bool isEmpty() {
    return !this._opponent && !this._player;
  }

  // bool equals(Player player1, Player player2) {
  //   return (this.isPlayer() && player1.isPlayer() && player2.isPlayer()) ||
  //       (this.isOpponent() && player1.isOpponent() && player2.isOpponent());
  // }

  bool equals(Player player1) {
    return (this.isPlayer() && player1.isPlayer()) ||
        (this.isOpponent() && player1.isOpponent());
  }

  ItemTableHash getItemTableHash() {
    if (this.isEmpty()) return ItemTableHash();
    return this.isPlayer()
        ? ItemTableHash().player()
        : ItemTableHash().opponent();
  }
}

class Players {
  static Player player = Player(0);
  static Player opponent = Player(1);
  static Player empty = Player(-1);
}
