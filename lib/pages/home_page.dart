import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/card/instrument_card.dart';

import '../components/title/title_with_button.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          titleWithButton(context, title: 'Instrumenti', buttonText: 'Vidi više', route: '/instruments'),
          Container (
            height: 250.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
                instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
              ],
            ),
          ),
          titleWithButton(context, title: 'Igrice', buttonText: 'Vidi više', route: '/games'),
          Container (
            height: 250.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
    );
  }
}
