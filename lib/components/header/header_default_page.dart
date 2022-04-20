import 'package:flutter/material.dart';

Column defaultPageHeader(context, {required String title}) {
  return Column(
      children: [
        ListTile(
          title: Text(title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Open Sans",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              )),
        )
      ]);
}
