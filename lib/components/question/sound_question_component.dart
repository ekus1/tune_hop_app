import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/game_type.dart';
import '../../models/question.dart';
import '../../models/user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../button/next_button.dart';
import '../card/jocker_card.dart';
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
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService = DatabaseService(_authService.getCurrentUserUid());

    return MultiProvider(
      providers: [
        StreamProvider<TuneHopUser?>.value(value: _databaseService.userData, initialData: TuneHopUser('', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)),
      ],
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            progressIndicator(context, progress: (index+1)/listLength, questionNumber: index+1, listLength: listLength),
            JokerCard(),
            soundQuestionCard(context, sound: question.soundPath!),
            AnswersField(answers: question.options, question: question, key: const Key('answers'), gameType: GameType.guessTheSound),
            nextButton(context, question: question, gameType: GameType.quiz)
          ],
        ),
      ),
    );
  }
}
