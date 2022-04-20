import 'package:flutter/material.dart';
import 'package:tune_hop_app/pages/home_page.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
          body: HomePage(),
          backgroundColor: Color(0xFFF6F3EE),
        ),
    );
  }
}
