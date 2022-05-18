import 'package:flutter/cupertino.dart';

import '../components/card/storeCard.dart';
import '../data/store_data.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> storeData = [];
    for (var element in storeCardData) {
      storeData.add(storeCard(context, storeCard: element));
    }

    return Container(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: storeData,
        ),
      ),
    );
  }
}
