import 'package:flutter/material.dart';

SizedBox gameCard(BuildContext context, {required String title, required String score}) {
  return SizedBox(
    height: 250,
    width: MediaQuery.of(context).size.width / 2,
    child: Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.abc_rounded,
                  size: 16.0,
                ),
                Text(
                    score,
                    style: const TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 16.0,
                    )
                ),
              ])
          )],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}