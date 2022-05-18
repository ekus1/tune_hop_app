enum GameType {
  quiz,
  guessTheSound,
  memory
}

GameType getGameType(String gT) {
  if (gT == "quiz") {
    return GameType.quiz;
  } else if (gT == "guessTheSound") {
    return GameType.guessTheSound;
  } else {
    return GameType.memory;
  }
}