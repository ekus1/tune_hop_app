import 'package:flutter/material.dart';

Container gameDifficultyButton(context, {String text = 'Vidi više', required String route, required String difficulty}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: 80.0,
      width: 300.0,
      child: TextButton(
        child: Text(text),
        style: TextButton.styleFrom(
          primary: const Color(0xFF548000),
          backgroundColor: const Color(0xFFB8DE6F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          textStyle: const TextStyle(
            fontFamily: "Open Sans",
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () { Navigator.pushReplacementNamed(context, route, arguments: difficulty); },
      ),
    ),
  );
}
