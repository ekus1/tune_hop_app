import 'package:flutter/material.dart';
import '../../models/game_type.dart';
import '../../models/question.dart';
import '../card/sound_question_card.dart';
import '../field/answers_filed.dart';
import '../indicator/progress_indicator.dart';

class SoundQuestionComponent extends StatelessWidget {
  const SoundQuestionComponent({
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
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          progressIndicator(context, progress: (index+1)/listLength),
          soundQuestionCard(context, sound: question.soundPath!),
          AnswersField(answers: question.options, question: question, key: const Key('answers'), gameType: GameType.guessTheSound),
        ],
      ),
    );
  }
}
