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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                              showAlertDialog(context);
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
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Container(
                                margin: EdgeInsets.only(right: 5.0),
                                child: const Icon(Icons.diamond_outlined,
                                    size: 22.0, color: Colors.white),
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

showAlertDialog(BuildContext buildContext) {
  String title = "Želiš li prekinuti igru?";
  String content = "Tvoj napredak neće biti spremljen!";

  AlertDialog alert = AlertDialog(
    title: Text(title,
        style: TextStyle(
          fontFamily: "Open Sans",
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        )),
    content: Container(
      height: MediaQuery.of(buildContext).size.height / 6,
      child: Column(
        children: [
          Expanded(
            child: Text(content,
                style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                )),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 125,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF8ab23b)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                      child: const Text("Ne",
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                Container(
                  width: 125,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            buildContext, '/', (Route<dynamic> route) => false);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xFFb23b4e)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                      child: const Text("Da",
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
  );

  showDialog(
      context: buildContext,
      builder: (BuildContext context) {
        return alert;
      });
}
