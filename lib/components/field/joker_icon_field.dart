import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container jokerIconField({required String name}) {
  String iconName = "+20";
  if (name == "Udvostručenje vrijednosti") {
    iconName = "x2";
  } else if (name == "Pola - pola") {
    iconName = "1/2";
  } else {
    iconName = "+20";
  }

  return Container(
      height: 30.0,
      width: 30.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Center(
        child: Text(iconName,
            style: TextStyle(
                fontSize: 12.0, color: Colors.white)),
      ));
}
