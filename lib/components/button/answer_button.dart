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
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width / 2 - 45,
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: getTheRightColor(),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,2),
                    blurRadius: 5.0
                )]
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(text,
                  style: const  TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: getTheRightColor(),
                ),
              ),
            ),
          );
        });
  }
}
