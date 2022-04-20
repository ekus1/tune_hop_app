import 'package:flutter/material.dart';

SizedBox instrumentCard(BuildContext context, {required String title, required String description}) {
  return SizedBox(
    height: 250,
    width: MediaQuery.of(context).size.width / 2,
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/background.jpg',
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            subtitle: Text(
                description,
                style: const TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 16.0,
                )
            ),
          )],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}