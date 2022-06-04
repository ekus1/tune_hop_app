enum AchievementType {
  correctAnswerQuiz,
  correctAnswerGuessTheSound,
  jokersBought,
  gamesPlayed
}

AchievementType getAchievementType(String aT) {
  if (aT == "correctAnswerQuiz") {
    return AchievementType.correctAnswerQuiz;
  } else if (aT == "correctAnswerGuessTheSound") {
    return AchievementType.correctAnswerGuessTheSound;
  } else if (aT == "jokersBought") {
    return AchievementType.jokersBought;
  } else {
    return AchievementType.gamesPlayed;
  }
}