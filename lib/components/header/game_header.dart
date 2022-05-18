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
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width / 3,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 22.0,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      SizedBox(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Center(
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5.0),
                                      child: const Icon(
                                        Icons.diamond_outlined,
                                        size: 18.0,
                                        color: Colors.white
                                      ),
                                    ),
                                    Text(getScore(),
                                        style: const TextStyle(
                                            fontFamily: "Open Sans",
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ])))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Center(
                            child: Text(getTimer(),
                                style: const TextStyle(
                                    fontFamily: "Open Sans",
                                    fontSize: 38.0,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white)),
                          )),
                      SizedBox(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width / 3,
                        child: Center(
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  Container(
                                    height: 32.0,
                                    width: 32.0,
                                    margin: const EdgeInsets.only(right: 5.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                                          },
                                          icon: const Icon(
                                            Icons.double_arrow,
                                            size: 20.0,
                                            color: Colors.white,
                                          )),
                                    )
                                  ),
                                  Container(
                                      height: 32.0,
                                      width: 32.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                                            },
                                            icon: const Icon(
                                              Icons.star_half,
                                              size: 20.0,
                                              color: Colors.white,
                                            )),
                                      )
                                  ),
                                ])),
                      )
                    ],
                  )
                ],
              ));
        });
  }
}
