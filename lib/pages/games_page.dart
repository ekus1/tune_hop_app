import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/card/game_card.dart';

import '../components/header/header.dart';

class GamesPage extends StatelessWidget{
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SizedBox> items = [
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
      gameCard(context, title: 'Klavir', score: 'Klavijature'),
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: header(context, isHomePage: false, title: 'Igrice', subtitle: '')
      ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              // width / height: fixed for *all* items
              childAspectRatio: 0.75,
            ),
            // return a custom ItemCard
            itemBuilder: (context, i) => items[i],
            itemCount: items.length,
          ),
        )
    );
  }
}
