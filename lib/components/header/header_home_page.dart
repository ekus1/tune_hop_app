import 'package:flutter/material.dart';

Column homePageHeader({required String title, required String subtitle}) {
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
          subtitle: Text(subtitle,
              style: const TextStyle(
                color: Color(0xFFe8ffc2),
                fontFamily: "Open Sans",
                fontSize: 16.0,
              )),
        )
      ]);
}
