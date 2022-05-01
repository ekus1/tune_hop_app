import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tune_hop_app/pages/game_difficulty_page.dart';
import 'package:tune_hop_app/pages/games_page.dart';
import 'package:tune_hop_app/pages/frame_page.dart';
import 'package:tune_hop_app/pages/instruments_page.dart';
import 'package:tune_hop_app/pages/quiz_page.dart';
import 'package:tune_hop_app/pages/score_page.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const FramePage(),
          '/instruments': (context) => const InstrumentsPage(),
          '/games': (context) => const GamesPage(),
          '/difficulty': (context) => const GamesDifficultyPage(),
          '/difficulty/quiz': (context) => const QuizPage(),
          '/score': (context) => const ScorePage(),
        },
    );
  }
}
