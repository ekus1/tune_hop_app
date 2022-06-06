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
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              children: [
              InkWell(
              onTap: () { showAlertDialog(context); },
              child: SizedBox(
                width: 300,
                child: Container(
                  child: Text(
                    'Kako osvojiti bodove?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
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

showAlertDialog(BuildContext buildContext) {
  String title = "Kako osvojiti bodove?";
  String content = "Svako pitanje donosi 10 bodova. Na tih 10 bodova dodaje se broj preostalih sekundi koji ostane nakon odabira odgovora.\n\nKako bi rezultati bio što bolji muge se iskoristiti jokeri.\n\nx2 donosi duple bodove\n+const 20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";

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
                onPressed: () { Navigator.pop(buildContext); },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF8ab23b)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    )
                ),
                child: const Text("U redu", style: TextStyle(
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
