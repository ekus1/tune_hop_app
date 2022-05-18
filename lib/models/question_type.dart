enum QuestionType {
  text,
  sound
}

QuestionType getQuestionType(String qT) {
  if (qT == "text") {
    return QuestionType.text;
  } else {
    return QuestionType.sound;
  }
}
