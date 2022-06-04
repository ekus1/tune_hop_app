import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/components/header/game_header.dart';
import '../components/question/question_component.dart';
import '../controller/question_controller.dart';
import '../models/question.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    log('data: $data');

    List<Question> questionList = Provider.of<List<Question>>(context);

    QuestionController _questionController = Get.put(QuestionController());
    _questionController.updateQuestions(questionList, data);

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: GameHeader(),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: const AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover
              )
          ),
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
