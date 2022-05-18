import 'package:tune_hop_app/models/question_difficulty.dart';
import 'package:tune_hop_app/models/question_type.dart';
import 'game_type.dart';

class GameRouteArguments {
  final QuestionDifficulty questionDifficulty;
  final QuestionType questionType;
  final GameType gameType;

  GameRouteArguments(this.questionDifficulty, this.questionType, this.gameType);
}
