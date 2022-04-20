import 'package:flutter/cupertino.dart';
import 'package:tune_hop_app/components/button/more_button.dart';

Container titleWithButton(context, {required String title, required String buttonText, required String route}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Open Sans",
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          moreButton(context, text: buttonText, route: route)
        ]
    )
  );
}