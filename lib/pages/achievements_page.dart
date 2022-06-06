import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/achievement_card.dart';

import '../components/card/achievement_card.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> achievements = [];

    final tuneHopUser = Provider.of<List<Achievement>>(context);
    for (var element in tuneHopUser) {
      achievements.add(AchievementCard(achievement: element));
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () { showAlertDialog(context); },
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Što su postignuća?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: achievements,
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext buildContext) {
  String title = "Što su postignuća?";
  String content = "Što više igraš više, to je tvoje znanje sve veće i savladavaš izazove! Igranjem osvajaš postignuća koja iza sebe kriju nagradu.\n\nAko postignuće pokraj sebe ima kvačicu, ono je već osvojeno. Ako je obojano zelenom bojom možeš pokupiti nagradu koja te čeka. Ako je postignuće sivo za njega moraš još učiti i igrati.";

  AlertDialog alert = AlertDialog(
    title: Text(title, style: TextStyle(
      fontFamily: "Open Sans",
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    )),
    content: Container(
      height: MediaQuery.of(buildContext).size.height / 2,
      child: Column(
        children: [
          Expanded(
            child: Text(content, style: TextStyle(
              fontFamily: "Open Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            )),
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton(
                onPressed: () { Navigator.pop(buildContext); },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF8ab23b)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    )
                ),
                child: const Text("U redu", style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))),
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
      }
  );
}
