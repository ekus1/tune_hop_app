import 'package:flutter/material.dart';

TextButton moreButton(context, {String text = 'Vidi više', required String route, required List<Widget> widgets}) {
  return TextButton(
    child: Text(text),
    style: TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: const Color(0xFF8ab23b),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0)
    ),
    onPressed: () { Navigator.pushNamed(context, route, arguments: widgets); },
  );
}
