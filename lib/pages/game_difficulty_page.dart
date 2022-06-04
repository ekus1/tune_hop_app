import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tune_hop_app/components/button/game_difficulty_button.dart';
import 'package:tune_hop_app/models/game_type.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/question_type.dart';

import '../components/header/header.dart';

class GamesDifficultyPage extends StatelessWidget{
  const GamesDifficultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    QuestionType questionType = QuestionType.text;
    if (data == GameType.guessTheSound.name) {
      questionType = QuestionType.sound;
    }
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: header(context, isHomePage: false, title: 'Težina igrice', subtitle: '')
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: const AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                gameDifficultyButton(context, text: 'Lagano', route: '/difficulty/$data', difficulty: QuestionDifficulty.easy, questionType: questionType),
                gameDifficultyButton(context, text: 'Srednje', route: '/difficulty/$data', difficulty: QuestionDifficulty.medium, questionType: questionType),
                gameDifficultyButton(context, text: 'Teško', route: '/difficulty/$data', difficulty: QuestionDifficulty.hard, questionType: questionType),
              ],
            ),
          ),
        )
    );
  }
}
