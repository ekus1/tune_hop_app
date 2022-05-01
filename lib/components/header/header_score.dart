import 'package:flutter/material.dart';

AppBar scoreHeader(context) {
  return AppBar(
    title: const Text('Rezultat',
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Open Sans",
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
    )),
    centerTitle: false,
    toolbarHeight: 80.0,
    backgroundColor: const Color(0xFF8ab23b),
    shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0)
        )
    ),
  );
}