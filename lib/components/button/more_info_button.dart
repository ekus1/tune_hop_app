import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

InkWell moreInfoButton(context, {required double width, required bool showAchievementsDialog}) {
  return InkWell(
    onTap: () {
      showAchievementsDialog == true ? showAchievementsPageDialog(context) : showGameDifficultyAlertDialog(context);
    },
    child: SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Text(
              'Kako osvojiti bodove',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(UniconsLine.question_circle),
        ],
      ),
    ),
  );
}

showGameDifficultyAlertDialog(BuildContext buildContext) {
  String title = "Kako osvojiti bodove?";
  String content =
      "Svako pitanje donosi 10 bodova. Na tih 10 bodova dodaje se broj preostalih sekundi koji ostane nakon odabira odgovora.\n\nKako bi rezultati bio što bolji muge se iskoristiti jokeri.\n\nx2 donosi duple bodove\n+20s dodaje 20 sekundi za odgovore\n1/2 prepolovi broj mogućih odgovora";

  AlertDialog alert = AlertDialog(
    title: Text(title,
        style: TextStyle(
          fontFamily: "Open Sans",
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        )),
    content: Container(
      height: MediaQuery.of(buildContext).size.height / 2,
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
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(buildContext);
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF8ab23b)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ))),
                child: const Text("U redu",
                    style: TextStyle(
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
      });
}

showAchievementsPageDialog(BuildContext buildContext) {
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
