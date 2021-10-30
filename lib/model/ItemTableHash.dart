import 'package:flutter/material.dart';

class ItemTableHash {
  IconData? iconSelected;
  Color? color;
  bool isEmpty = true;

  ItemTableHash player() {
    iconSelected = Icons.check;
    color = Colors.green;
    isEmpty = false;
    return this;
  }

  ItemTableHash opponent() {
    iconSelected = Icons.offline_bolt_outlined;
    color = Colors.red;
    isEmpty = false;
    return this;
  }
}
