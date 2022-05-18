import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:tune_hop_app/models/instrument_category.dart';
import 'package:tune_hop_app/models/instrument_details.dart';
import '../components/header/header.dart';

class InstrumentDetailsPage extends StatelessWidget {
  const InstrumentDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = AudioCache();

    var data = Get.arguments;

    final instrumentList = Provider.of<List<InstrumentDetails>>(context);
    InstrumentDetails instrumentDetails =
        instrumentList.where((element) => element.uid == data).toList().first;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: header(context,
                isHomePage: false,
                title: instrumentDetails.name,
                subtitle: '')),
        body: Container(
          alignment: Alignment.center,
          child: Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: FittedBox(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(instrumentDetails.picturePath)),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                              bottom: 15,
                              right: 15,
                              child: new IconButton(
                                onPressed: () {
                                  player.play(instrumentDetails.audioPath);
                                },
                                icon:
                                    Icon(Icons.volume_up, color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                      child: Text(
                        'Kategorija:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 30.0, right: 30.0),
                        child: Text(instrumentDetails
                            .instrumentCategory.nameDescription)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                      child: Text(
                        'Mjesto i vrijeme:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 30.0, right: 30.0),
                        child: Text(instrumentDetails.dateInvented +
                            ', ' +
                            instrumentDetails.placeInvented)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                      child: Text(
                        'Povjest glazbala:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 30.0, right: 30.0),
                        child: Text(instrumentDetails.history)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                      child: Text(
                        'Zabavne činjenice:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 30.0, right: 30.0),
                        child: Text(instrumentDetails.funFacts)),
                  ],
                ),
              )),
        ));
  }
}
