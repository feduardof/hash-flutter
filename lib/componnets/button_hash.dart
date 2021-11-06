import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonHash extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool disable;

  const ButtonHash(
      {Key? key,
      required this.title,
      required this.onTap,
      this.disable = false})
      : super(key: key);

  @override
  _ButtonHashState createState() => _ButtonHashState();
}

class _ButtonHashState extends State<ButtonHash> {
  var isTap = false;

  @override
  Widget build(BuildContext context) {
    var buttonColor =
        widget.disable ? Color(0xFFffee00).withOpacity(0.2) : Color(0xFFffee00);
    var buttonPressColor =
        widget.disable ? Color(0xFFffEE00).withOpacity(0.2) : Color(0xFFffAA33);
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: isTap ? buttonPressColor : buttonColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          widget.title,
          style: GoogleFonts.oregano(fontSize: 20, letterSpacing: 3),
        ),
      ),
      onTap: () {
        animateTap();
        widget.onTap();
      },
    );
  }

  animateTap() async {
    setState(() {
      isTap = true;
    });
    await Future.delayed(Duration(milliseconds: 110));
    setState(() {
      isTap = false;
    });
  }
}
