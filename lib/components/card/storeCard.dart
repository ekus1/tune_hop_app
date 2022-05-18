import 'package:flutter/material.dart';
import 'package:tune_hop_app/models/store_card.dart';

Container storeCard(BuildContext context, {required StoreCard storeCard}) {
  return Container(
    height: MediaQuery.of(context).size.height / 5 - 10,
    width: MediaQuery.of(context).size.width - 20,
    child: Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF8AB23B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: const Icon(Icons.access_alarm_outlined,
                        size: 32, color: Colors.white),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Icon(Icons.diamond_outlined,
                            size: 16.0, color: Colors.white),
                        Text(storeCard.price.toString(),
                            style: const TextStyle(
                                fontFamily: "Open Sans",
                                fontSize: 16.0,
                                color: Colors.white)),
                      ])),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 1.0),
                    child: Text(storeCard.name,
                        style: const TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 1.0),
                    child: Text(storeCard.description,
                        style: const TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 16.0,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 1.0),
                      child: TextButton(
                        child: Text('Kupi'),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: const Color(0xFF8ab23b),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0)),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (Route<dynamic> route) => false);
                        },
                      )),
                ]),
          )
        ],
      ),
    ),
  );
}
