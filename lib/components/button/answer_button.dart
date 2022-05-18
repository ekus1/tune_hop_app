import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/question_controller.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required Key key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return const Color(0xFF8ab23b);
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return const Color(0xFFd14f26);
              }
            }
            return Colors.white;
          }

          return InkWell(
            onTap: press,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2 - 50,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: getTheRightColor(),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: getTheRightColor(),
                ),
              ),
            ),
          );
        });
  }
}
