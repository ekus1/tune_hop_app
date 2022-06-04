import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/components/title/congratulations_title.dart';

import '../components/header/header_score.dart';
import '../models/user.dart';
import '../services/auth.dart';
import '../services/database.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    final DatabaseService _databaseService = DatabaseService(_authService.getCurrentUserUid());

    var user = Provider.of<TuneHopUser?>(context);
    var data = Get.arguments;

    return MultiProvider(
      providers: [
        StreamProvider<TuneHopUser?>.value(value: _databaseService.userData, initialData: TuneHopUser('', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)),
      ],
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: scoreHeader(context),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: const AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover
                )
            ),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0, bottom: 40.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children: [
                  const Expanded(flex: 1, child: CongratulationsTitle()),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.diamond_outlined,
                              size: 32.0, color: Colors.black),
                        ),
                        Text(data[0].toString(),
                            style: const TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ])),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                            child: TextButton(
                              child: Text('+ 20 sec.', style: TextStyle(
                                  fontSize: 18.0
                              )),
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: const Color(0xFF8ab23b),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0)
                              ),
                              onPressed: () async {
                                await DatabaseService(user?.uid).updateScores(user!, data[1], data[0]);
                                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                            child: TextButton(
                              child: Text('Nastavi', style: TextStyle(
                                fontSize: 18.0
                              )),
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: const Color(0xFF8ab23b),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0)
                              ),
                              onPressed: () async {
                                await DatabaseService(user?.uid).updateScores(user!, data[1], data[0]);
                                await DatabaseService(user.uid).updateGameStats(user, data[1], data[2]);
                                await DatabaseService(user.uid).checkForAchievements(user);
                                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                              },
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
            )
          )
      ),
    );
  }
}
