import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/card/instrument_card.dart';

import '../components/header/header.dart';

class GamesPage extends StatelessWidget{
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: header(context, isHomePage: false, title: 'Igrice', subtitle: '')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox (
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
