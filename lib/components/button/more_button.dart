import 'package:flutter/material.dart';

TextButton moreButton(context, {String text = 'Vidi više', required String route, required List<Widget> widgets}) {
  return TextButton(
    child: Text(text,
    style: const TextStyle(
      fontSize: 16.0
    )),
    style: TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: const Color(0xFF8ab23b),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0)
    ),
    onPressed: () { Navigator.pushNamed(context, route, arguments: widgets); },
  );
}
