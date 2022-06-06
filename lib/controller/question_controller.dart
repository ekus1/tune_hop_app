import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tune_hop_app/models/game_route_arguments.dart';
import 'package:tune_hop_app/models/game_type.dart';
import 'package:tune_hop_app/models/question_difficulty.dart';
import '../models/question.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late AnimationController _animationController;
  AnimationController get animationController => this._animationController;

  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  late List<Question> _questions;
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
  set setTimerSeconds(int additionalSeconds) {
    this._timerSeconds = additionalSeconds;
  }

  late int _score = 0;
  int get score => this._score;

  late int _spareSeconds = 0;
  int get spareSeconds => this._spareSeconds;

  late bool _isDoubleValueUsed = false;
  bool get isDoubleValueUsed => this._isDoubleValueUsed;
  set isDoubleValueUser(bool value) {
    this._isDoubleValueUsed = value;
  }

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

    _animationController.forward().whenComplete(() => nextQuestion);
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  updateQuestions(List<Question> questionList, GameRouteArguments gameRouteArguments) {
    _animationController.reset();
    var value = 60;
    if (gameRouteArguments.questionDifficulty == QuestionDifficulty.easy) {
      value = 60;
    } else if (gameRouteArguments.questionDifficulty == QuestionDifficulty.medium) {
      value = 50;
    } else {
      value = 40;
    }

    _timerSeconds = value;
    _animation = IntTween(begin: 0, end: value).animate(_animationController)
      ..addListener(() {
        _timerSeconds = int.parse(value.toString()) - int.parse(_animation.value.toString());
        update();
      });
    _animationController.forward().whenComplete(() => nextQuestion);
    _questions = questionList
        .where((element) {
            return element.questionDifficulty.name == gameRouteArguments.questionDifficulty.name;
          })
        .where((element) {
          return element.questionType == gameRouteArguments.questionType;
        })
        .toList();
    update();
  }

  void checkAns(Question question, int selectedIndex, GameType gameType) {
    log('here');
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
      if (_isDoubleValueUsed) {
        _score+=20;
      } else {
        _score+=10;
      }
      _spareSeconds+=_timerSeconds;
    }
    _isDoubleValueUsed = false;

    _animationController.stop();
    update();
  }

  void nextQuestion() {
    var value = _questionNumber.value;
    var length = _questions.length;

    var data = Get.arguments;

    var animationValue = 60;
    if (data.questionDifficulty == QuestionDifficulty.easy) {
      animationValue = 60;
    } else if (data.questionDifficulty == QuestionDifficulty.medium) {
      animationValue = 50;
    } else {
      animationValue = 40;
    }

    if (value != length - 1) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.ease);

      _animationController.reset();

      _animation = IntTween(begin: 0, end: animationValue).animate(_animationController)
        ..addListener(() {
          _timerSeconds = int.parse(animationValue.toString()) - int.parse(_animation.value.toString());
          update();
        });

      _animationController.forward().whenComplete(() => nextQuestion);
    } else {
      var scoreValue = _score + _spareSeconds;
      var correctAnswers = _numOfCorrectAns;
      _isAnswered = false;
      _questionNumber = 0.obs;
      _numOfCorrectAns = 0;
      _score = 0;
      _spareSeconds = 0;

      Get.offAllNamed('/score', arguments: [scoreValue, data.gameType, correctAnswers, data.questionDifficulty]);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index;
  }

  void setSeconds(int currentSeconds) {
    _animationController.reset();
    var endValue = currentSeconds + 20;
    _animation = IntTween(begin: 0, end: endValue).animate(_animationController)
      ..addListener(() {
        _timerSeconds = int.parse(endValue.toString()) - int.parse(_animation.value.toString());
        update();
      });
    _animationController.forward().whenComplete(() => nextQuestion);
  }

  void setIsDoubleValueUsed() {
    _isDoubleValueUsed = true;
    update();
  }

}
