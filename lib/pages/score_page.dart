import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tune_hop_app/components/button/more_button.dart';

import '../components/header/header_score.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: scoreHeader(context),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 180.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Center(
                      child: Text('Čestitamo!',
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          )
                      )),
                ),
                Expanded(child: Center(
                    child: Text(data[0].toString(),
                        style: const TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        )
                    )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                      moreButton(context, text: '+ 20 sec.', route: '/'),
                      moreButton(context, text: 'Dalje', route: '/'),
                    ],
                  )
                )
              ],
            ),
          )
        )
    );
  }
}
