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
        StreamProvider<TuneHopUser?>.value(value: _databaseService.userData, initialData: TuneHopUser('', 0, 0, 0, 0, 0, 0)),
      ],
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: scoreHeader(context),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: const AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover
                )
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 140.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                children: [
                  const CongratulationsTitle(),
                  Expanded(child: Center(
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
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
                          height: 80,
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
                              Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
                            },
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            )
          )
      ),
    );
  }
}
