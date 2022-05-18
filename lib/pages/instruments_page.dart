import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/header/header.dart';

class InstrumentsPage extends StatelessWidget{
  const InstrumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: header(context, isHomePage: false, title: 'Instrumenti', subtitle: '')
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
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