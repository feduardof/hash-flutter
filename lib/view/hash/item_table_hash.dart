import 'package:flutter/material.dart';
import 'package:hash/model/ItemTableHash.dart';

class ItemTableWidget extends StatefulWidget {
  final int x;
  final int y;
  final Function onTap;
  final ItemTableHash item;

  const ItemTableWidget({
    Key? key,
    required this.x,
    required this.y,
    required this.onTap,
    required this.item,
  }) : super(key: key);

  @override
  _ItemTableWidgetState createState() => _ItemTableWidgetState();
}

class _ItemTableWidgetState extends State<ItemTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: widget.x < 2
                  ? BorderSide(width: 0.5, color: Color(0xFFFFFFFF))
                  : BorderSide.none,
              right: widget.y < 2
                  ? BorderSide(width: 0.5, color: Color(0xFFFFFFFF))
                  : BorderSide.none,
            ),
          ),
          height: 120.0,
          child: !widget.item.isEmpty
              ? Icon(
                  widget.item.iconSelected,
                  color: widget.item.color,
                  size: 52.0,
                )
              : null,
        ),
      ),
    );
  }

  onTap() {
    if (!widget.item.isEmpty) return;
    widget.onTap(
      x: widget.x,
      y: widget.y,
    );
  }

  // setIcon(ItemTableHash paramItemTableHash) {
  //   setState(() {
  //     itemTableHash = paramItemTableHash;
  //   });
  // }
}
