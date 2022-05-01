import 'package:flutter/material.dart';
import 'package:tune_hop_app/components/card/instrument_card.dart';

import '../components/header/header.dart';

class InstrumentsPage extends StatelessWidget{
  const InstrumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SizedBox> items = [
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
      instrumentCard(context, title: 'Klavir', description: 'Klavijature'),
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: header(context, isHomePage: false, title: 'Instrumenti', subtitle: '')
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 0.75,
          ),
          // return a custom ItemCard
          itemBuilder: (context, i) => items[i],
          itemCount: items.length,
        ),
      )
    );
  }
}