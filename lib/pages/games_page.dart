import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/header/header.dart';

class GamesPage extends StatelessWidget{
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: header(context, isHomePage: false, title: 'Igrice', subtitle: '')
      ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              // width / height: fixed for *all* items
              childAspectRatio: 0.75,
            ),
            // return a custom ItemCard
            itemBuilder: (context, i) => data[i],
            itemCount: data.length,
          ),
        )
    );
  }
}
