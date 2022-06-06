import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Container progressIndicator(BuildContext context, {required double progress, required int questionNumber,required int listLength}) {
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 20.0,
    margin:
        const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
    decoration: const BoxDecoration(boxShadow: [
      BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 5.0)
    ]),
    child: Stack(children: [
      LinearPercentIndicator(
        lineHeight: 20.0,
        percent: progress,
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: Colors.white,
        progressColor: const Color(0xFF8ab23b),
      ),
      Positioned(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              questionNumber.toString() + "/" + listLength.toString(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.end,
            )),
      )
    ]),
  );
}
