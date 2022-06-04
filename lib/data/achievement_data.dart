import 'package:tune_hop_app/models/achievement_card.dart';
import 'package:tune_hop_app/models/achievement_type.dart';

List<Achievement> achievementData = [
  Achievement(1, 'Točno odogovoreno na 5 pitanja u igrici Kviz', 50, false, false, AchievementType.correctAnswerQuiz, 5),
  Achievement(2, "Točno odogvoreno na 5 pitanja u igrici Pogodi zvuk", 50, false, false, AchievementType.correctAnswerGuessTheSound, 5),
  Achievement(3, "Odigrano ukupno 5 igrica", 50, false, false, AchievementType.gamesPlayed, 5),
  Achievement(4, "Kupljeno 5 jokera", 100, false, false, AchievementType.jokersBought, 5)
];