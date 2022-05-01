import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../data/question_data.dart';
import '../models/question.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  late List<Question> _questions = easyQuestions;

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  late RxInt _questionNumber = 0.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  late int _timerSeconds = 60;
  int get timerSeconds => this._timerSeconds;

  late int _score = 0;
  int get score => this._score;

  @override
  void onInit() {
    _animationController = AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _score = 0;
    _timerSeconds = 60;
    _animation = IntTween(begin: 0, end: 60).animate(_animationController)
      ..addListener(() {
        _timerSeconds = int.parse('60') - int.parse(_animation.value.toString());
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = new PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  updateQuestions(String difficulty) {
    if (difficulty == 'easy') {
      _questions = easyQuestions;
    } else if (difficulty == 'medium') {
      _questions = mediumQuestions;
    } else {
      _questions = hardQuestions;
    }
    update();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
      _score+=10;
    }

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    var value = _questionNumber.value;
    var length = _questions.length;
    if (value != length - 1) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      var scoreValue = _score;
      _isAnswered = false;
      _questionNumber = 0.obs;
      _numOfCorrectAns = 0;
      _score = 0;
      Get.offAndToNamed('/score', arguments: [scoreValue]);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index;
  }
}
