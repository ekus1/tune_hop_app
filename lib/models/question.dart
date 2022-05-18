import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/question_type.dart';

class Question {
  final int answer;
  final String question;
  final List<String> options;
  final QuestionType questionType;
  final QuestionDifficulty questionDifficulty;
  final String? soundPath;

  Question(this.question, this.answer, this.options, this.questionType, this.questionDifficulty, [this.soundPath]);

  Question.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
      ) :
        question = snapshot.data()?["question"],
        answer = snapshot.data()?["answer"],
        options = List<String>.from(snapshot.data()?["options"]),
        questionType = getQuestionType(snapshot.data()?["questionType"]),
        questionDifficulty = getQuestionDifficulty(snapshot.data()?["questionDifficulty"]),
        soundPath = snapshot.data()?["soundPath"];

  Map<String, dynamic> toFirestore() {
    return {
      if (question != null) "question": question,
      if (answer != null) "answer": answer,
      if (options != null) "options": options,
      if (questionDifficulty != null) "questionDifficulty": questionDifficulty,
      if (questionType != null) "questionType": questionType,
      if (soundPath != null) "soundPath": soundPath,
    };
  }

}
