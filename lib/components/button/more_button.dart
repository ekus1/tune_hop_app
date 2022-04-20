import 'package:flutter/material.dart';

TextButton moreButton({required String text}) {
  return TextButton(
    child: Text(text),
    style: TextButton.styleFrom(
      primary: const Color(0xFF548000),
      backgroundColor: const Color(0xFFB8DE6F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0)
    ),
    onPressed: () { },
  );
}