import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash/model/hash_scorboard.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HashScoreboardWidget extends StatelessWidget {
  final HashScoreboard scoreboard;

  const HashScoreboardWidget({Key? key, required this.scoreboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Spacer(),
          Column(
            children: [
              RxBuilder(
                builder: (_) => Text(
                  this.scoreboard.playerScore.value.toString(),
                  style: GoogleFonts.oregano(
                    fontSize: 24,
                    letterSpacing: 3,
                    color: Color(0xFF15e014),
                  ),
                ),
              ),
              Text(
                "Player",
                style: GoogleFonts.oregano(
                  fontSize: 16,
                  letterSpacing: 3,
                  color: Color(0xFF15e014),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              RxBuilder(
                builder: (_) => Text(
                  this.scoreboard.opponentScore.value.toString(),
                  style: GoogleFonts.oregano(
                    fontSize: 24,
                    letterSpacing: 3,
                    color: Color(0xFFFF4444),
                  ),
                ),
              ),
              Text(
                "Opponent",
                style: GoogleFonts.oregano(
                  fontSize: 16,
                  letterSpacing: 3,
                  color: Color(0xFFFF4444),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              RxBuilder(
                builder: (_) => Text(
                  this.scoreboard.drawnsScore.value.toString(),
                  style: GoogleFonts.oregano(
                    fontSize: 24,
                    letterSpacing: 3,
                    color: Color(0xFFF0088FF),
                  ),
                ),
              ),
              Text(
                "Drawn",
                style: GoogleFonts.oregano(
                  fontSize: 16,
                  letterSpacing: 3,
                  color: Color(0xFFF0088FF),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
