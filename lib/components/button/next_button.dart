import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tune_hop_app/models/game_type.dart';

import '../../controller/question_controller.dart';
import '../../models/question.dart';

Container nextButton(context, {String text = 'Dalje', required Question question, required GameType gameType}) {
  QuestionController _questionController = Get.put(QuestionController());
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 50.0,
    margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 20.0),
    decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0,2),
              blurRadius: 5.0
          )]
    ),
    child: TextButton(
      child: Text(text,
        style: const  TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500
        ),
      ),
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: const Color(0xFF8ab23b),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.only(left: 5.0, right: 5.0)
      ),
      onPressed: () { _questionController.checkAns(question, 4, gameType); },
    ),
  );
}
