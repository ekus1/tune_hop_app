import 'package:flutter/material.dart';

Row defaultPageHeader(context, {required String title}) {
  String imageUrl = 'assets/images/header_monkey.png';
  if (title == "Postignuća") {
    imageUrl = 'assets/images/header_elephant.png';
  } else if(title == "Trgovina") {
    imageUrl = 'assets/images/header_monkey.png';
  } else {
    imageUrl = 'assets/images/header_tiger.png';
  }
  return Row(
      children: [
        Expanded(
          flex: 5,
          child: ListTile(
            title: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Open Sans",
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(imageUrl,
                fit: BoxFit.contain,
              ),
            )),
      ]);
}
