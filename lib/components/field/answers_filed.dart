import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/question_controller.dart';
import '../../models/question.dart';
import '../button/answer_button.dart';

class AnswersField extends StatelessWidget {
  const AnswersField({
    required Key key,
    required this.answers,
    required this.question,
  }) : super(key: key);

  final List<String> answers;
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              AnswerButton(text: answers[0], index: 0, press: () => _questionController.checkAns(question, 0), key: Key(answers[0])),
              AnswerButton(text: answers[1], index: 1, press: () => _questionController.checkAns(question, 1), key: Key(answers[1])),
            ],
          ),
          Row(
            children: [
              AnswerButton(text: answers[2], index: 2, press: () => _questionController.checkAns(question, 2), key: Key(answers[2])),
              AnswerButton(text: answers[3], index: 3, press: () => _questionController.checkAns(question, 3), key: Key(answers[3])),
            ],
          )
        ],
      ),
    );
  }
}
