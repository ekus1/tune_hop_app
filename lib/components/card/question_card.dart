import 'package:flutter/material.dart';

Expanded questionCard(BuildContext context, {required String question}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      width: MediaQuery.of(context).size.width - 40,
      child: Center(
        child: Text(
            question,
            style: const TextStyle(
              fontFamily: "Open Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )
        ),
      )
    ),
  );
}