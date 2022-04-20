import 'package:flutter/cupertino.dart';
import 'package:tune_hop_app/components/button/more_button.dart';

Container titleWithButton({required String title, required String buttonText}) {
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
          moreButton(text: buttonText)
        ]
    )
  );
}