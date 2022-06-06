import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tune_hop_app/models/game_route_arguments.dart';
import 'package:tune_hop_app/models/game_type.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/question_type.dart';

Container gameDifficultyButton(context,
    {String text = 'Vidi više',
    required String route,
    required QuestionDifficulty difficulty,
    required QuestionType questionType}) {
  int difficultyColor = 0xFF8ab23b;
  difficulty == QuestionDifficulty.easy
      ? difficultyColor = 0xFF8ab23b
      : difficulty == QuestionDifficulty.medium
          ? difficultyColor = 0xFFd76b28
          : difficultyColor = 0xFFb23b4e;
  GameType gameType = questionType == QuestionType.sound
      ? GameType.guessTheSound
      : GameType.quiz;

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
        onPressed: () {
          showAlertDialog(context, route, difficulty, questionType, gameType);
        },
      ),
    ),
  );
}

showAlertDialog(BuildContext buildContext, String route,
    QuestionDifficulty difficulty, QuestionType questionType, GameType gameType) {
  String title = "";
  String content = "";
  if (gameType == GameType.quiz) {
    if (difficulty == QuestionDifficulty.easy) {
      title = "Lagano";
      content = "Kviz ima 10 pitanja. Za svako pitanje imaš 60 sekundi za odgovor.\n\nZa svako pitanje možeš iskoristiti jokere.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";
    } else if (difficulty == QuestionDifficulty.medium) {
      title = "Srednje";
      content = "Kviz ima 15 pitanja. Za svako pitanje imaš 50 sekundi za odgovor.\n\nZa svako pitanje možeš iskoristiti jokere.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";
    } else {
      title = "Teško";
      content = "Kviz ima 20 pitanja. Za svako pitanje imaš 40 sekundi za odgovor.\n\nZa svako pitanje možeš iskoristiti jokere.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";
    }
  } else {
    if (difficulty == QuestionDifficulty.easy) {
      title = "Lagano";
      content = "Pogodi zvuk ima 10 pitanja. Za svako pitanje imaš 60 sekundi za odgovor.\n\nZa svako pitanje možeš iskoristiti jokere.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";
    } else if (difficulty == QuestionDifficulty.medium) {
      title = "Srednje";
      content = "Pogodi zvuk ima 15 pitanja. Za svako pitanje imaš 50 sekundi za odgovor.\n\nZa svako pitanje možeš iskoristiti jokere.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";
    } else {
      title = "Teško";
      content = "Pogodi zvuk ima 20 pitanja. Za svako pitanje imaš 40 sekundi za odgovor.\n\nZa svako pitanje možeš iskoristiti jokere.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";
    }
  }


  AlertDialog alert = AlertDialog(
    title: Text(title, style: TextStyle(
      fontFamily: "Open Sans",
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    )),
    content: Container(
      height: MediaQuery.of(buildContext).size.height / 2,
      child: Column(
        children: [
          Expanded(
            child: Text(content, style: TextStyle(
              fontFamily: "Open Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            )),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(route,
                      arguments: GameRouteArguments(difficulty, questionType, gameType));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF8ab23b)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
            )
          )
                ),
                child: const Text("Kreni!", style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))),
          )
        ],
      ),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
  );

  showDialog(
      context: buildContext,
      builder: (BuildContext context) {
        return alert;
      }
  );
}
