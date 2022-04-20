import 'package:flutter/material.dart';
import 'package:tune_hop_app/pages/home_page.dart';

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
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            iconSize: 22.0,
            color: Colors.white,
            onPressed: () { },
          ),
        )
      ]);
}
