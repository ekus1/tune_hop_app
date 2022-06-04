import 'package:flutter/material.dart';

Expanded questionCard(BuildContext context, {required String question}) {
  return Expanded(
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 5.0)
            ]),
        width: MediaQuery.of(context).size.width - 40,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(question,
                style: const TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
        )),
  );
}
