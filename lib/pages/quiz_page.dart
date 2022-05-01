import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tune_hop_app/components/header/game_header.dart';
import '../components/question/question_component.dart';
import '../controller/question_controller.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    log('data: $data');
    QuestionController _questionController = Get.put(QuestionController());
    _questionController.updateQuestions(data);
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: GameHeader()
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _questionController.pageController,
            onPageChanged: _questionController.updateTheQnNum,
            itemCount: _questionController.questions.length,
            itemBuilder: (context, index) => QuestionComponent(
                question: _questionController.questions[index], index: index, listLength: _questionController.questions.length, key: Key(index.toString())),
          ),
        )
    );
  }
}
