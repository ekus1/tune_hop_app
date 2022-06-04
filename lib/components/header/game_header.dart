import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/question_controller.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          String getTimer() {
            if (qnController.timerSeconds == 60) {
              return '01:00';
            } else {
              if (qnController.timerSeconds < 10) {
                return '00:0' + qnController.timerSeconds.toString();
              }
              return '00:' + qnController.timerSeconds.toString();
            }
          }

          String getScore() {
            return qnController.score.toString();
          }

          return Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF8ab23b),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60.0,
                        padding: const EdgeInsets.only(left: 20.0),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 22.0,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(
                          height: 60.0,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(getTimer(),
                                style: const TextStyle(
                                    fontFamily: "Open Sans",
                                    fontSize: 38.0,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white)),
                          )),
                      SizedBox(
                          height: 60.0,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5.0),
                                      child: const Icon(
                                        Icons.diamond_outlined,
                                        size: 22.0,
                                        color: Colors.white
                                      ),
                                    ),
                                    Text(getScore(),
                                        style: const TextStyle(
                                            fontFamily: "Open Sans",
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white)),
                                  ])))
                    ],
                  ),
              ]));
        });
  }
}
