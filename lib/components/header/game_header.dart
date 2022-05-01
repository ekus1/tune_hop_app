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
              decoration: BoxDecoration(
                  color: const Color(0xFF8ab23b),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/');
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 16.0,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(
                          height: 40.0,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          child: Center(
                            child: Text(
                                getScore(),
                                style: const TextStyle(
                                    fontFamily: "Open Sans",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                          )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 40.0,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          child: Center(
                            child: Text(
                                getTimer(),
                                style: const TextStyle(
                                    fontFamily: "Open Sans",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                          )
                      ),
                      SizedBox(
                          height: 40.0,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          child: const Center(
                            child: Text(
                                'jockeri',
                                style: TextStyle(
                                    fontFamily: "Open Sans",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                          )
                      )
                    ],
                  )
                ],
              )
          );
        });
  }
}
