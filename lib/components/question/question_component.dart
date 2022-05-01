import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../card/question_card.dart';
import '../field/answers_filed.dart';
import '../indicator/progress_indicator.dart';

class QuestionComponent extends StatelessWidget {
  const QuestionComponent({
    required Key key,
    required this.question,
    required this.index,
    required this.listLength,
  }) : super(key: key);

  final int index;
  final int listLength;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          progressIndicator(context, progress: (index+1)/listLength),
          questionCard(context, question: question.question),
          AnswersField(answers: question.options, question: question, key: const Key('answers')),
        ],
      ),
    );
  }
}
