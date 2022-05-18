import 'game_type.dart';

class GameCard {
  final String name, picturePath;
  final int highScore;
  final GameType gameType;

  GameCard(this.name, this.highScore, this.picturePath, this.gameType);
}