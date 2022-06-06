import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card/storeCard.dart';
import '../data/store_data.dart';
import '../models/user.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TuneHopUser?>(context);

    final List<Widget> storeData = [];
    for (var element in storeCardData) {
      storeData.add(StoreCard(storeData: element));
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child:
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0,),
                          child: const Icon(Icons.diamond_outlined,
                              size: 18.0,
                              color: Colors.black87),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Text(user?.diamonds.toString() ?? "",
                              style: const TextStyle(
                                  fontFamily: "Open Sans",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                        ),
                      ]))),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: storeData,
            ),
          ),
        ],
      ),
    );
  }
}
