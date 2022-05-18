import 'package:flutter/material.dart';
import 'package:tune_hop_app/models/instrument_category.dart';

import '../../models/instrument_card.dart';

Container instrumentCard(BuildContext context, {required InstrumentCard instrumentCard}) {
  return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: InkWell(
        onTap: () => {
          Navigator.pushNamed(context, '/instruments/details',
              arguments: instrumentCard.uid)
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      instrumentCard.picturePath,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
                        child: Text(instrumentCard.name,
                            style: const TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
                        child: Text(instrumentCard.instrumentCategory.nameDescription,
                            style: const TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 14.0,
                            )),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ));
}
