enum QuestionDifficulty {
  easy,
  medium,
  hard
}

QuestionDifficulty getQuestionDifficulty(String qD) {
  if (qD == "easy") {
    return QuestionDifficulty.easy;
  } else if (qD == "medium") {
    return QuestionDifficulty.medium;
  } else {
    return QuestionDifficulty.hard;
  }
}
