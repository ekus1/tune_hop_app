import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/card/instrument_card.dart';
import 'package:tune_hop_app/components/title/title_with_button.dart';

import '../components/header/header.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: header(context, isHomePage: true, title: 'Dobro došla nazad!', subtitle: "Ana Marija Jurić Katrunđić")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            titleWithButton(title: 'Instrumenti', buttonText: 'Vidi više'),
            SizedBox (
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                ],
              ),
            ),
            titleWithButton(title: 'Igrice', buttonText: 'Vidi više'),
            SizedBox (
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                  instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
