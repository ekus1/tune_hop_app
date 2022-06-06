import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/controller/question_controller.dart';

import '../../models/user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class JokerCard extends StatelessWidget {
  const JokerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService =
        DatabaseService(_authService.getCurrentUserUid());

    final user = Provider.of<TuneHopUser?>(context);

    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          void addSeconds() {
            if (user!.additionalTimeJockerCount > 0) {
              int timerSec = qnController.timerSeconds;
              if (timerSec != 0) {
                qnController.setSeconds(timerSec);
                _databaseService.updateAdditionalTimeJoker();
              }
            }
          }

          void doubleValue() {
            if (user!.doubleValueJockerCount > 0) {
              qnController.setIsDoubleValueUsed();
              _databaseService.updateDoubleScoreJoker();
            }
          }

          return Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 38.0,
                      width: 38.0,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: user!.additionalTimeJockerCount > 0
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            addSeconds();
                          },
                          child: const Text('+20',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white)),
                        ),
                      )),
                  Container(
                      height: 38.0,
                      width: 38.0,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: user.doubleValueJockerCount > 0
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            doubleValue();
                          },
                          child: const Text('x2',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white)),
                        ),
                      )),
                  Container(
                      height: 38.0,
                      width: 38.0,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: user.halfAndHalfJockerCount > 0
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (Route<dynamic> route) => false);
                          },
                          child: const Text('1/2',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white)),
                        ),
                      )),
                ],
              ));
        });
  }
}
