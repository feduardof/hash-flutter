import 'package:flutter/material.dart';
import 'package:hash/componnets/title_app.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;

  const ScaffoldApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3d4479),
      body: Wrap(
        spacing: 0,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 130,
            child: TitleApp(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: (MediaQuery.of(context).size.height * 1) - 130,
            child: child,
          ),
        ],
      ),
    );
  }
}
