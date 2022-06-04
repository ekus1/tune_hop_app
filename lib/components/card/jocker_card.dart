import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container jockerCard(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: 38.0,
              width: 38.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (Route<dynamic> route) => false);
                  },
                  child: const Text('+20',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white
                      )),
                ),
              )),
          Container(
              height: 38.0,
              width: 38.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (Route<dynamic> route) => false);
                  },
                  child: const Text('x2',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white
                      )),
                ),
              )),
          Container(
              height: 38.0,
              width: 38.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (Route<dynamic> route) => false);
                  },
                  child: const Text('1/2',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white
                      )),
                ),
              )),
        ],
      ));
}
