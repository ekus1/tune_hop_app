import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Container progressIndicator(BuildContext context, {required double progress}) {
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    padding: const EdgeInsets.only(top: 40.0, bottom: 20.0, left: 10.0, right: 10.0),
    child: LinearPercentIndicator(
      lineHeight: 20.0,
      percent: progress,
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: Colors.white,
      progressColor: const Color(0xFF8ab23b),
    ),
  );
}
