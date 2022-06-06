import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/components/card/instrument_card.dart';
import 'package:tune_hop_app/models/game_card.dart';
import 'package:tune_hop_app/models/instrument_card.dart';

import '../components/card/game_card.dart';
import '../components/title/title_with_button.dart';
import '../models/game_type.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> instruments = [];
    final List<Widget> games = [];

    final user = Provider.of<TuneHopUser?>(context);

    final instrumentList = Provider.of<List<InstrumentCard>>(context);
    for (var element in instrumentList) {
      instruments.add(instrumentCard(context, instrumentCard: element));
    }

    final gameList = Provider.of<List<GameCard>>(context);
    for (var element in gameList) {
      var highScore = 0;
      if (element.gameType == GameType.quiz) {
        highScore = user?.quizScore ?? 0;
      } else {
        highScore = user?.guessTheSoundScore ?? 0;
      }
      games.add(gameCard(context, gameCard: element, highScore: highScore));
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            titleWithButton(context,
                title: 'Instrumenti',
                buttonText: 'Vidi više',
                route: '/instruments', widgets: instruments),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: instruments,
                ),
              ),
            ),
            titleWithButton(context,
                title: 'Igrice', buttonText: 'Vidi više', route: '/games', widgets: games),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: games,
                ),
              ),
            )
          ],
        ),
      );
  }
}
