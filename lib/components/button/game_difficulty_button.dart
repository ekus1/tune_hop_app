import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tune_hop_app/models/game_route_arguments.dart';
import 'package:tune_hop_app/models/game_type.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/question_type.dart';

Container gameDifficultyButton(context, {String text = 'Vidi više', required String route, required QuestionDifficulty difficulty, required QuestionType questionType}) {
  int difficultyColor = 0xFF8ab23b;
  difficulty == QuestionDifficulty.easy ? difficultyColor = 0xFF8ab23b : difficulty == QuestionDifficulty.medium ? difficultyColor = 0xFFd76b28 : difficultyColor = 0xFFb23b4e;
  GameType gameType = questionType == QuestionType.sound ? GameType.guessTheSound : GameType.quiz;

  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: 80.0,
      width: 300.0,
      child: TextButton(
        child: Text(text),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Color(difficultyColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          textStyle: const TextStyle(
            fontFamily: "Open Sans",
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () { Get.offAndToNamed(route, arguments: GameRouteArguments(difficulty, questionType, gameType)); },
      ),
    ),
  );
}
