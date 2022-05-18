import 'package:flutter/cupertino.dart';
import 'package:tune_hop_app/components/button/more_button.dart';

Container titleWithButton(context, {required String title, required String buttonText, required String route, required List<Widget> widgets}) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
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
          moreButton(context, text: buttonText, route: route, widgets: widgets)
        ]
    )
  );
}