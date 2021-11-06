import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "H",
              style: GoogleFonts.oregano(
                fontSize: 80,
                letterSpacing: 3,
                color: Color(0xFF15e014),
              ),
            ),
            Text(
              "a",
              style: GoogleFonts.oregano(
                fontSize: 80,
                letterSpacing: 3,
                color: Color(0xFFFF0000),
              ),
            ),
            Text(
              "s",
              style: GoogleFonts.oregano(
                fontSize: 80,
                letterSpacing: 3,
                color: Color(0xFFFFF000),
              ),
            ),
            Text(
              "h",
              style: GoogleFonts.oregano(
                fontSize: 80,
                letterSpacing: 3,
                color: Color(0xFFF0088FF),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Game",
              style: GoogleFonts.oregano(
                fontSize: 20,
                color: Color(0xFFFF0000),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
