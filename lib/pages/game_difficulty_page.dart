import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/button/game_difficulty_button.dart';

class GamesDifficultyPage extends StatelessWidget{
  const GamesDifficultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 300.0,
        child: Column(
          children: [
            gameDifficultyButton(context, text: 'Lagano', route: '/difficulty/quiz', difficulty: 'easy'),
            gameDifficultyButton(context, text: 'Srednje', route: '/difficulty/quiz', difficulty: 'medium'),
            gameDifficultyButton(context, text: 'Teško', route: '/difficulty/quiz', difficulty: 'hard'),
          ],
        ),
      ),
    );
  }
}
