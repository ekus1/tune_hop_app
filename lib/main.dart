import 'package:flutter/material.dart';
import 'package:tune_hop_app/pages/games_page.dart';
import 'package:tune_hop_app/pages/home_page.dart';
import 'package:tune_hop_app/pages/instruments_page.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/instruments': (context) => const InstrumentsPage(),
          '/games': (context) => const GamesPage()
        },
    );
  }
}
