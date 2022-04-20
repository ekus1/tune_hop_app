import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/card/instrument_card.dart';

import '../components/header/header.dart';

class InstrumentsPage extends StatelessWidget{
  const InstrumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: header(context, isHomePage: false, title: 'Instrumenti', subtitle: '')
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox (
              height: double.maxFinite,
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
